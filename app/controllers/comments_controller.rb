class CommentsController < ApplicationController
  before_action :set_article!
  before_action :authenticate_user!, only: [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    flash[:notice] = "Комментарий создан!"
    redirect_to article_path(@article)
  end

  private

  def set_article!
    @article = Article.find params[:article_id]
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
