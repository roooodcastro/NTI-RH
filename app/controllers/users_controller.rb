class UsersController < ApplicationController

  before_filter :login_required, :except => [:login, :do_login]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def home
    
  end

  def new
    @user = User.new
    unless current_user.email == "nti.rhadmin@gmail.com"
      respond_to do |format|
        format.html { redirect_to(home_path, :alert => "Você não tem permissão para fazer isso") }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'Usuário criado com sucesso') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Usuário alterado com sucesso') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(home_path, :notice => 'Usuário excluído com sucesso') }
    end
  end

  def login
    @user = User.new
  end

  def do_login
    session[:current_user] = User.find_by_email_and_password(params[:user][:email], params[:user][:password])
    respond_to do |format|
      if current_user
        format.html { redirect_to(home_path, :notice => "Bem vindo ao sistema, #{current_user.nome}") }
      else
        format.html { redirect_to(login_path, :alert => "Login não realizado, usuário ou senha incorretos") }
      end
    end
  end

  def do_logout
    reset_session
    respond_to do |format|
      format.html { redirect_to(root_path, :notice => "Desconectado do sistema") }
    end
  end


end
