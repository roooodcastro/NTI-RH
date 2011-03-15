class AddColumnVinculadoAndSenhaToPessoa < ActiveRecord::Migration
  def self.up
    add_column :pessoas, :vinculado, :boolean, :default => false
    add_column :pessoas, :senha, :string, :lenght => 192
  end

  def self.down
    remove_column :pessoas, :vinculado
    remove_Column :pessoas, :senha
  end
end
