class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.integer :autor_id
      t.text :texto
      t.integer :destinatario_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
