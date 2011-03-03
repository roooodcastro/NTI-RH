class AddColumnDataTerminoToProjeto < ActiveRecord::Migration
  def self.up
    add_column :projetos, :data_final, :date
  end

  def self.down
    remove column :projetos, :data_final
  end
end
