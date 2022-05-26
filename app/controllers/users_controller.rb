class UsersController < ApplicationController
  before_action :set_user

  def profile
    @articles = @user.articles.order(created_at: :desc)
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
end
