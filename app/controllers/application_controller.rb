class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling
  before_action :set_query


  def set_query
    @query = Article.ransack(params[:q])
  end

end
