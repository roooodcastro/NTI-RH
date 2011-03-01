class CompetenciasController < ApplicationController

  before_filter :login_required

  def index
    @competencias = Competencia.all
  end

  def show
    @competencia = Competencia.find(params[:id])
  end

  def new
    @competencia = Competencia.new
    @competencia.pessoa_id = params[:pessoa_id]
    @conhecimentos = Conhecimento.all
  end

  def edit
    @competencia = Competencia.find(params[:id])
    @conhecimentos = Conhecimento.all
  end

  def create
    @competencia = Competencia.new(params[:competencia])
    pessoa = Pessoa.find_by_id @competencia.pessoa_id
    respond_to do |format|
      if @competencia.save
        format.html { redirect_to(pessoa, :notice => 'Competência adicionada com sucesso.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @competencia = Competencia.find(params[:id])
    respond_to do |format|
      if @competencia.update_attributes(params[:competencia])
        format.html { redirect_to(@competencia, :notice => 'Competencia was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @competencia = Competencia.find(params[:id])
    pessoa = Pessoa.find_by_id @competencia.pessoa_id
    @competencia.destroy
    respond_to do |format|
      format.html { redirect_to(pessoa) }
    end
  end
end
