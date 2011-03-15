class AddColumnEmailToPessoa < ActiveRecord::Migration
  def self.up
    add_column :pessoas, :email, :string
  end

  def self.down
    remove_column :pessoas, :email
  end
end
