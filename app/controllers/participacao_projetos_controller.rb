class ParticipacaoProjetosController < ApplicationController
  def index
    @participacao_projetos = ParticipacaoProjeto.all
  end

  def show
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
  end

  def new
    @participacao_projeto = ParticipacaoProjeto.new
    @vinculos = Vinculo.all
    @projetos = Projeto.all
    @cargos = Cargo.all
    if @projetos.empty?
      redirect_to :back, :alert => 'Não é possível incluir participantes porque não existe nenhum projeto cadastrado'
    end
    if not Vinculo.has_active_vinculo?
      redirect_to :back, :alert => 'Não é possível incluir participantes porque não existe nenhum vínculo ativo'
    end
  end

  def edit
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
  end

  def create
    @participacao_projeto = ParticipacaoProjeto.new(params[:participacao_projeto])
    respond_to do |format|
      if @participacao_projeto.save
        format.html { redirect_to(@participacao_projeto, :notice => 'Participacao projeto was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
    respond_to do |format|
      if @participacao_projeto.update_attributes(params[:participacao_projeto])
        format.html { redirect_to(@participacao_projeto, :notice => 'Participacao projeto was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
    @participacao_projeto.destroy
    respond_to do |format|
      format.html { redirect_to(participacao_projetos_url) }
    end
  end
end
