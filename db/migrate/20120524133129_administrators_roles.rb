class AdministratorsRoles < ActiveRecord::Migration
  def up
    create_table :administrators_roles, :id => false do |t|
      t.references :administrator, :null => false
      t.references :role, :null => false
    end
    add_index(:administrators_roles, [:administrator_id, :role_id], :unique => true)
  end

  def down
  end
end
