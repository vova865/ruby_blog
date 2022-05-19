class UsersController < ApplicationControllerКомментарий
  before_action :set_user

  def profile
    @articles = @user.articles.order(created_at: :desc)
    # @article =
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
