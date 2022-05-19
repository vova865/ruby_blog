class ArticlesController < ApplicationController
  before_action :set_article!, only: %i[show destroy edit update]
  before_action :authenticate_user!, only: %i[new edit]
  before_action :set_categories

  def home_page; end

  def index
    @pagy, @articles = pagy Article.all
  end

  def show
    @article.update(views: @article.views + 1)
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      flash[:notice] = t('.notice')
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @article = Article.new
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = t('.notice')
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = t('.notice')
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article!
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :category_id, :image)
  end

  def set_categories
    @categories = Category.all.order(:name)
  end
end
