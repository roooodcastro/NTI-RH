class CreateCompetencias < ActiveRecord::Migration
  def self.up
    create_table :competencias do |t|
      t.integer :grau
      t.integer :pessoa_id
      t.integer :conhecimento_id

      t.timestamps
    end
  end

  def self.down
    drop_table :competencias
  end
end
