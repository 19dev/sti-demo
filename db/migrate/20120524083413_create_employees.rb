class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :salary
      t.string :hours
      t.string :duration
      t.string :university
      t.string :type

      t.timestamps
    end
  end
end
