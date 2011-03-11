class VinculosController < ApplicationController
  def index
    @vinculos = Vinculo.all
  end

  def show
    @vinculo = Vinculo.find(params[:id])
  end

  def new
    @vinculo = Vinculo.new
    @pessoas = Pessoa.all
  end

  def edit
    @vinculo = Vinculo.find(params[:id])
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