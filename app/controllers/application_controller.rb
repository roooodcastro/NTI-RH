require_dependency 'password'

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :current_pessoa

  def index
    
  end

  def login_required
    redirect_to(root_path, :alert => 'Acesso restrito. Você tem que estar logado para entrar nessa área') unless current_user or current_pessoa
  end

  def admin_required
    redirect_to(root_path, :alert => 'Acesso restrito. Você não tem permissão para entrar nesta área') unless current_user
  end

  def pessoa_required
    redirect_to(root_path, :alert => 'Acesso restrito. Você não tem permissão para entrar nesta área') unless current_pessoa
  end

  private
  def current_user
    @current_user = session[:current_user]
  end

  def current_pessoa
    @current_pessoa = session[:current_pessoa]
  end

end
