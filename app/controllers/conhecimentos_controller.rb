class ConhecimentosController < ApplicationController

  before_filter :login_required

  def index
    @conhecimentos = Conhecimento.all
  end

  def show
    @conhecimento = Conhecimento.find(params[:id])
  end

  def new
    @conhecimento = Conhecimento.new
  end

  def edit
    @conhecimento = Conhecimento.find(params[:id])
  end

  def create
    @conhecimento = Conhecimento.new(params[:conhecimento])
    respond_to do |format|
      if @conhecimento.save
        format.html { redirect_to(@conhecimento, :notice => 'Conhecimento was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @conhecimento = Conhecimento.find(params[:id])
    respond_to do |format|
      if @conhecimento.update_attributes(params[:conhecimento])
        format.html { redirect_to(@conhecimento, :notice => 'Conhecimento was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @conhecimento = Conhecimento.find(params[:id])
    @conhecimento.destroy
    respond_to do |format|
      format.html { redirect_to(conhecimentos_url) }
    end
  end
end
