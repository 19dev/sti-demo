class Role < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :users, :join_table => 'users_roles'

#  has_and_belongs_to_many :administrators
#  has_and_belongs_to_many :editors
#  has_and_belongs_to_many :authors
end
