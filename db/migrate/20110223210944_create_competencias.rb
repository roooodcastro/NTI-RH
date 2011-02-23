class CreateCompetencias < ActiveRecord::Migration
  def self.up
    create_table :competencias do |t|
      t.integer :grau

      t.timestamps
    end
  end

  def self.down
    drop_table :competencias
  end
end
