class ParticipacaoProjetosController < ApplicationController

  before_filter :admin_required, :except => [:show, :save_comment]
  before_filter :login_required, :only => [:show]

  def index
    @participacao_projetos = ParticipacaoProjeto.all
  end

  def show
    @participacao_projeto = ParticipacaoProjeto.find(params[:id])
    @comentarios = @participacao_projeto.comentarios.order("created_at DESC")
    @comentario = Comentario.new
    if current_pessoa
      @comentario.autor_id = current_pessoa.id
    end
    @comentario.destinatario_id = @participacao_projeto.id
  end

  def save_comment
    @comentario = Comentario.new(params[:comentario])
    if @comentario.texto != ""
      respond_to do |format|
        if @comentario.save
          format.html { redirect_to :back, :notice => "Comentário postado" }
          format.js {}
        else
          format.html { redirect_to :back, :alert => "Erro na criação do comentário" }
        end
      end
    end
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
