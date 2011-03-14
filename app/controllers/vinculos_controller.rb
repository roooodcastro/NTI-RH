class VinculosController < ApplicationController
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
    @vinculo.save
    respond_to do |format|
      format.html { redirect_to vinculos_path, :notice => 'Pessoa desvinculada com sucesso' }
    end
  end

  def destroy
    @vinculo = Vinculo.find(params[:id])
    @vinculo.destroy
    respond_to do |format|
      format.html { redirect_to(vinculos_url) }
    end
  end
end