class Editor < User
  has_and_belongs_to_many :roles, :join_table => 'users_roles', :foreign_key => 'user_id'
end
