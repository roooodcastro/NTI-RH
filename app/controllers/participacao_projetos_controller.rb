class ParticipacaoProjetosController < ApplicationController
  # GET /participacao_projetos
  # GET /participacao_projetos.xml
  def index
    @participacao_projetos = ParticipacaoProjeto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participacao_projetos }
    end
  end

  # GET /participacao_projetos/1
  # GET /participacao_projetos/1.xml
  def show
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participacao_projeto }
    end
  end

  # GET /participacao_projetos/new
  # GET /participacao_projetos/new.xml
  def new
    @participacao_projeto = ParticipacaoProjeto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participacao_projeto }
    end
  end

  # GET /participacao_projetos/1/edit
  def edit
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
  end

  # POST /participacao_projetos
  # POST /participacao_projetos.xml
  def create
    @participacao_projeto = ParticipacaoProjeto.new(params[:participacao_projeto])

    respond_to do |format|
      if @participacao_projeto.save
        format.html { redirect_to(@participacao_projeto, :notice => 'Participacao projeto was successfully created.') }
        format.xml  { render :xml => @participacao_projeto, :status => :created, :location => @participacao_projeto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participacao_projeto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participacao_projetos/1
  # PUT /participacao_projetos/1.xml
  def update
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])

    respond_to do |format|
      if @participacao_projeto.update_attributes(params[:participacao_projeto])
        format.html { redirect_to(@participacao_projeto, :notice => 'Participacao projeto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participacao_projeto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participacao_projetos/1
  # DELETE /participacao_projetos/1.xml
  def destroy
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
    @participacao_projeto.destroy

    respond_to do |format|
      format.html { redirect_to(participacao_projetos_url) }
      format.xml  { head :ok }
    end
  end
end
