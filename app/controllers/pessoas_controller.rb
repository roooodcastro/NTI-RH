class PessoasController < ApplicationController

  before_filter :login_required, :except => [:profile, :login, :do_login]
  before_filter :admin_required, :only => [:index]
  before_filter :pessoa_is_logged_in?, :only => [:edit, :update, :destroy]

  def index
    @pessoas = Pessoa.all
  end

  def home
    
  end

  def show
    @pessoa = Pessoa.includes(:competencias => :conhecimento).find(params[:id])
  end

  def new
    @pessoa = Pessoa.new
  end

  def edit
    @pessoa = Pessoa.find(params[:id])
    @pessoa.senha = nil
  end

  def create
    @pessoa = Pessoa.new(params[:pessoa])
    @pessoa.senha = Password.update(params[:pessoa][:senha])
    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to(@pessoa, :notice => 'Pessoa criada com sucesso') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @pessoa = Pessoa.find(params[:id])
    params[:pessoa][:senha] = Password.update(params[:pessoa][:senha])
    respond_to do |format|
      if @pessoa.update_attributes(params[:pessoa])
        format.html { redirect_to(@pessoa, :notice => 'Pessoa atualizada com sucesso') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @pessoa = Pessoa.find(params[:id])
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to(pessoas_url) }
    end
  end

  def profile
    @pessoa = Pessoa.find(params[:id])
  end

  def login
    @pessoa = Pessoa.new
  end

  def do_login
    pessoa = Pessoa.find_by_email(params[:pessoa][:email])
    session[:current_pessoa] = pessoa if Password::check(params[:pessoa][:senha], pessoa.senha)
    respond_to do |format|
      if current_pessoa
        session[:current_user] = nil
        format.html { redirect_to(home_path, :notice => "Bem vindo ao sistema, #{current_pessoa.nome}") }
      else
        format.html { redirect_to(login_path, :alert => "Login não realizado, email ou senha incorretos") }
      end
    end
  end

  def do_logout
    reset_session
    redirect_to root_path, :notice => "Desconectado do sistema"
  end

  def pessoa_is_logged_in?
    if (not current_user) and (not params[:id].to_i == current_pessoa.id)
      redirect_to :back, :alert => "Acesso restrito. Você não tem permissão de alterar o cadastro de outra pessoa"
    end
  end
end
