class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    
  end

  def login_required
    redirect_to(root_path, :alert => 'Acesso restrito. Você tem que estar logado para entrar nessa área') unless session[:current_user] and User.find(session[:current_user])
  end
  
end
