# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120524133129) do

  create_table "administrators_roles", :id => false, :force => true do |t|
    t.integer "administrator_id", :null => false
    t.integer "role_id",          :null => false
  end

  add_index "administrators_roles", ["administrator_id", "role_id"], :name => "index_administrators_roles_on_administrator_id_and_role_id", :unique => true

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "salary"
    t.string   "hours"
    t.string   "duration"
    t.string   "university"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
