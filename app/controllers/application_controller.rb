class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling
  before_action :set_query

  around_action :switch_locale

  def set_query
    @query = Article.ransack(params[:q])
  end

  private

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)
  end

  def default_url_options
    { locale: I18n.locale}
  end

  # private
  #
  # def after_sign_out_path_for(resource_or_scope)
  #   redirect_to root_path
  # end
end
