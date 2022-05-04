class CategoriesController < ApplicationController
  before_action :set_categories

  def show

  end

  private

  def set_categories
    @category = Category.find(params[:id])
  end
end
