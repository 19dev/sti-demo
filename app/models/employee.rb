class Employee < ActiveRecord::Base
  attr_accessible :duration, :hours, :name, :salary, :type, :university
end
