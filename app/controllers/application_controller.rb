require_dependency 'password'

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def index
    
  end

  def login_required
    redirect_to(root_path, :alert => 'Acesso restrito. Você tem que estar logado para entrar nessa área') unless current_user
  end

  private
  def current_user
    @current_user ||= session[:current_user]
  end

end
