class CargosController < ApplicationController

  before_filter :login_required

  def index
    @cargos = Cargo.all
  end

  def show
    @cargo = Cargo.find(params[:id])
  end

  def new
    @cargo = Cargo.new
  end

  def edit
    @cargo = Cargo.find(params[:id])
  end

  def create
    @cargo = Cargo.new(params[:cargo])
    respond_to do |format|
      if @cargo.save
        format.html { redirect_to(@cargo, :notice => 'Cargo was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @cargo = Cargo.find(params[:id])
    respond_to do |format|
      if @cargo.update_attributes(params[:cargo])
        format.html { redirect_to(@cargo, :notice => 'Cargo was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @cargo = Cargo.find(params[:id])
    @cargo.destroy
    respond_to do |format|
      format.html { redirect_to(cargos_url) }
    end
  end
end
