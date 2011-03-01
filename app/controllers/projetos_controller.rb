class ProjetosController < ApplicationController

  before_filter :login_required

  def index
    @projetos = Projeto.all
  end

  def show
    @projeto = Projeto.find(params[:id])
  end

  def new
    @projeto = Projeto.new
  end

  def edit
    @projeto = Projeto.find(params[:id])
  end

  def create
    @projeto = Projeto.new(params[:projeto])
    respond_to do |format|
      if @projeto.save
        format.html { redirect_to(@projeto, :notice => 'Projeto was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @projeto = Projeto.find(params[:id])
    respond_to do |format|
      if @projeto.update_attributes(params[:projeto])
        format.html { redirect_to(@projeto, :notice => 'Projeto was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @projeto = Projeto.find(params[:id])
    @projeto.destroy
    respond_to do |format|
      format.html { redirect_to(projetos_url) }
    end
  end
end
