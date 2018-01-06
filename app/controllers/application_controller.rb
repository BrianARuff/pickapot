class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_params, if: :devise_controller?
  before_action :categories

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :user_name, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :user_name, :name])
  end

  def categories
    @categories = Category.all.order(:name)
  end
end
