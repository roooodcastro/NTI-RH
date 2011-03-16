module ComentarioHelper

  def comentario_is_from_current_pessoa comentario
    if current_pessoa
      return comentario.autor_id == current_pessoa.id
    end
  end

end
