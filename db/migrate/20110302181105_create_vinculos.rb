class CreateVinculos < ActiveRecord::Migration
  def self.up
    create_table :vinculos do |t|
      t.integer :pessoa_id
      t.date :dataEntrada
      t.date :dataSaida
      t.float :salario
      t.string :banco
      t.string :agencia
      t.integer :conta

      t.timestamps
    end
  end

  def self.down
    drop_table :vinculos
  end
end
