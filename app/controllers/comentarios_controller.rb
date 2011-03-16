class ComentariosController < ApplicationController
  def index
    @comentarios = Comentario.all
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def new
    @comentario = Comentario.new
  end

  def edit
    @comentario = Comentario.find(params[:id])
  end

  def create
    @comentario = Comentario.new(params[:comentario])
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to(@comentario, :notice => 'Comentario was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @comentario = Comentario.find(params[:id])
    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to(@comentario, :notice => 'Comentario was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.js {}
    end
  end
end
