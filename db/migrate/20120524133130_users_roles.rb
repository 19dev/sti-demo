class UsersRoles < ActiveRecord::Migration
  def up
    create_table :users_roles, :id => false do |t|
      t.references :user, :null => false
      t.references :role, :null => false
    end
    add_index(:users_roles, [:user_id, :role_id], :unique => true)
  end

  def down
  end
end
