class ArticlesController < ApplicationController
  before_action :set_article!, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]

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
      flash[:notice] = "Вопрос создан!"
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
      flash[:notice] = "Статья обновлена!"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Статья удалена!"
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article!
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
