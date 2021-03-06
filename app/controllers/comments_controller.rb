class CommentsController < ApplicationController
  before_action :set_article!
  before_action :authenticate_user!, only: [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    flash[:notice] = 'Comment created!'
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.destroy
    flash[:notice] = 'Comment delete!'
    redirect_to article_path(@article)
  end

  private

  def set_article!
    @article = Article.find params[:article_id]
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
