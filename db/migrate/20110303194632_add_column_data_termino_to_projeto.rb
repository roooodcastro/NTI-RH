class AddColumnDataTerminoToProjeto < ActiveRecord::Migration
  def self.up
    add_column :projetos, :terminado, :boolean, :default => false
  end

  def self.down
    remove_column :projetos, :terminado
  end
end
