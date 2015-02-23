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
    @category = Category.find(params[:category_id])
    @article = @category.articles.build(article_params)
    @article.author = current_user

    if @article.save
      redirect_to category_article_path(@category, @article)
    else
      @errors = @article.errors
      render :new
    end
  end

  def article_params
    params.require(:article).permit(:title, :description, :price)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
