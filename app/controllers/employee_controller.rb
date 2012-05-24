class EmployeeController < ApplicationController
  def index
    @employees = Employee.all
  end
end
