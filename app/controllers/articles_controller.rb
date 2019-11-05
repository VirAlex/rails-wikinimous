class ArticlesController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(task_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    @article.update(task_params)
    redirect_to '/articles', notice: 'All good'
  end

  def destroy
    @article.destroy
    redirect_to '/articles', notice: "#{@article.title} have been successfully destroyed"
  end

  private

  def task_params
    params.require(:article).permit(:title, :content)
  end

  def find_task
    @article = Article.find(params[:id])
  end
end
