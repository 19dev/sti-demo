class User < ActiveRecord::Base
  attr_accessible :name, :type
  has_and_belongs_to_many :roles, :join_table => 'users_roles'
end
