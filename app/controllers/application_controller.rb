class ApplicationController < ActionController::Base
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  def resource_name
    :cliente
  end

  def resource
    @resource ||= Cliente.new
  end

  def resource_class
    Cliente
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:cliente]
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome_cliente, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nome_cliente, :last_name, :email, :password, :password_confirmation, :current_password)}
  end
end