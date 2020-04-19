class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to root_path
  end

  def update
    @article = Article.find(params[:id])
    @article.update(articles_params)
    if @article.save
      redirect_to root_path
    else
      render edit
    end
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      redirect_to root_path
    else
      render new
    end
  end

private

  def articles_params
    params.require(:article).permit(:title, :content)
  end
end
