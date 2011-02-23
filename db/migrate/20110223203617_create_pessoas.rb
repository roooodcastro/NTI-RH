class CreatePessoas < ActiveRecord::Migration
  def self.up
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf, :limit => 11
      t.string :celular, :limit => 10
      t.string :endereco

      t.timestamps
    end
  end

  def self.down
    drop_table :pessoas
  end
end
