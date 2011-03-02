class CreateParticipacaoProjetos < ActiveRecord::Migration
  def self.up
    create_table :participacao_projetos do |t|
      t.date :dataInicio
      t.date :dataTermino
      t.integer :vinculo_id
      t.integer :cargo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :participacao_projetos
  end
end
