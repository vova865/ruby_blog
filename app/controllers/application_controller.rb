class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling
  before_action :set_query

  def set_query
    @query = Article.ransack(params[:q])
  end


  # private
  #
  # def after_sign_out_path_for(resource_or_scope)
  #   redirect_to root_path
  # end
end
