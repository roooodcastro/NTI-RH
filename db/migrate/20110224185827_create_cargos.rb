class CreateCargos < ActiveRecord::Migration
  def self.up
    create_table :cargos do |t|
      t.string :nome
      t.string :pre_requisitos
      t.float :salario_piso
      t.float :salario_teto
      t.string :tempo_minimo
      t.string :tempo_maximo
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :cargos
  end
end
