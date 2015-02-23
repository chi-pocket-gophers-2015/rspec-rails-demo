class ArticlesController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @category = Category.find(params[:category_id])
    @articles = @category.articles
  end

  def new
    @categories = Category.all
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    @article.category = Category.find_by_id(params[:article][:category])

    if @article.save
      redirect_to category_article_path(@article.category, @article)
    else
      @categories = Category.all
      @errors = @article.errors
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @categories = Category.all
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.attributes = article_params
    @article.category = Category.find_by_id(params[:article][:category])

    if @article.save
      redirect_to category_article_path(@article.category, @article)
    else
      @errors = @article.errors
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to dashboard_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :price)
  end
end
