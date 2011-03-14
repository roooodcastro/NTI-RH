class AddColumnDataTerminoToProjeto < ActiveRecord::Migration
  def self.up
    add_column :projetos, :data_final, :date
    add_column :projetos, :terminado, :boolean
  end

  def self.down
    remove_column :projetos, :data_final
    remove_column :projetos, :terminado
  end
end
