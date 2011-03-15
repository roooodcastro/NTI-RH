class VinculosController < ApplicationController

  before_filter :admin_required, :except => [:show, :old]
  before_filter :login_required, :only => [:show, :old]

  def index
    @vinculos = Vinculo.where :dataSaida => nil
  end

  def show
    @vinculo = Vinculo.find(params[:id])
  end

  def new
    @vinculo = Vinculo.new
    if params[:id]
      @pessoa = Pessoa.find(params[:id])
      if @pessoa
        if @pessoa.vinculado
          redirect_to :back, :alert => "Esta pessoa já está vinculada, não é possível vinculá-la novamente"
        end
        @nome_pessoa = @pessoa.nome
        @vinculo.pessoa_id = @pessoa.id
      end
    else
      @nome_pessoa = "pessoa"
    end
    @pessoas = Pessoa.all
    if @pessoas.empty?
      redirect_to :back, :alert => 'Não é possível vincular uma pessoa pois não há ninguém cadastrado'
    end
  end

  def edit
    @vinculo = Vinculo.find(params[:id])
    @pessoas = Pessoa.all
  end

  def create
    @vinculo = Vinculo.new(params[:vinculo])
    pessoa = Pessoa.find params[:vinculo][:pessoa_id]
    pessoa.vinculado = true
    pessoa.save
    respond_to do |format|
      if @vinculo.save
        format.html { redirect_to(@vinculo, :notice => 'Pessoa vinculada com sucesso') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @vinculo = Vinculo.find(params[:id])
    respond_to do |format|
      if @vinculo.update_attributes(params[:vinculo])
        format.html { redirect_to(@vinculo, :notice => 'Vínculo atualizado com sucesso') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def finalize
    @vinculo = Vinculo.find(params[:id])
    @vinculo.dataSaida = Date.today
    pessoa = Pessoa.find(@vinculo.pessoa_id)
    pessoa.vinculado = false
    @vinculo.save
    pessoa.save
    respond_to do |format|
      format.html { redirect_to vinculos_path, :notice => 'Pessoa desvinculada com sucesso' }
    end
  end

  def old
    @vinculos = Vinculo.find(:all, :conditions => ["pessoa_id = #{current_pessoa.id} AND dataSaida IS NOT NULL"])
  end
end