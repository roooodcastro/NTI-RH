class PessoasController < ApplicationController

  before_filter :login_required, :except => [:profile]

  def index
    @pessoas = Pessoa.all
  end

  def show
    @pessoa = Pessoa.includes(:competencias => :conhecimento).find(params[:id])
  end

  def new
    @pessoa = Pessoa.new
  end

  def edit
    @pessoa = Pessoa.find(params[:id])
  end

  def create
    @pessoa = Pessoa.new(params[:pessoa])
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
end
