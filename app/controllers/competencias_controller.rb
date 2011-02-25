class CompetenciasController < ApplicationController
  # GET /competencias
  # GET /competencias.xml
  def index
    @competencias = Competencia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @competencias }
    end
  end

  # GET /competencias/1
  # GET /competencias/1.xml
  def show
    @competencia = Competencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @competencia }
    end
  end

  # GET /competencias/new
  # GET /competencias/new.xml
  def new
    @competencia = Competencia.new
    @competencia.pessoa_id = params[:pessoa_id]
    @conhecimentos = Conhecimento.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @competencia }
    end
  end

  # GET /competencias/1/edit
  def edit
    @competencia = Competencia.find(params[:id])
    @conhecimentos = Conhecimento.all
  end

  # POST /competencias
  # POST /competencias.xml
  def create
    @competencia = Competencia.new(params[:competencia])
    pessoa = Pessoa.find_by_id @competencia.pessoa_id

    respond_to do |format|
      if @competencia.save
        format.html { redirect_to(pessoa, :notice => 'Competência adicionada com sucesso.') }
        format.xml  { render :xml => @competencia, :status => :created, :location => @competencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @competencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /competencias/1
  # PUT /competencias/1.xml
  def update
    @competencia = Competencia.find(params[:id])

    respond_to do |format|
      if @competencia.update_attributes(params[:competencia])
        format.html { redirect_to(@competencia, :notice => 'Competencia was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @competencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /competencias/1
  # DELETE /competencias/1.xml
  def destroy
    @competencia = Competencia.find(params[:id])
    pessoa = Pessoa.find_by_id @competencia.pessoa_id
    @competencia.destroy

    respond_to do |format|
      format.html { redirect_to(pessoa) }
      format.xml  { head :ok }
    end
  end
end
