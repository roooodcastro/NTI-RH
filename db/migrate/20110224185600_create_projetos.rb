class CreateProjetos < ActiveRecord::Migration
  def self.up
    create_table :projetos do |t|
      t.string :nome
      t.date :data_inicial
      t.date :data_final
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :projetos
  end
end
