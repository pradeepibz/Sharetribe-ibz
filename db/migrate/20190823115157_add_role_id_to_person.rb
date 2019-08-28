class AddRoleIdToPerson < ActiveRecord::Migration[5.2]
  def self.up
    add_column :people, :role_id, :integer
  end

  def self.down
    remove_column :people, :role_id
  end
end
