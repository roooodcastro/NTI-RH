class AddColumnProjetoIdToParticipacaoProjetos < ActiveRecord::Migration
  def self.up
    add_column :participacao_projetos, :projeto_id, :integer
  end

  def self.down
    remove_column :participacao_projetos, :projeto_id
  end
end
