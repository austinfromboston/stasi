# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080713220618) do

  create_table "agents", :force => true do |t|
    t.string  "name"
    t.string  "email"
    t.string  "phone"
    t.string  "login"
    t.integer "help_staffer_id"
  end

  create_table "agents_tickets", :force => true do |t|
    t.integer "agent_id"
    t.integer "ticket_id"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "project_id"
    t.integer  "help_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hour_logs", :force => true do |t|
    t.integer  "agent_id"
    t.integer  "ticket_id"
    t.integer  "minutes"
    t.integer  "help_hour_id"
    t.string   "source"
    t.string   "billing_type"
    t.string   "project_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "url"
    t.string   "organization"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_data_imports", :force => true do |t|
    t.string   "filename"
    t.string   "content_type"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "help_ticket_id"
    t.integer  "messages_count"
    t.string   "subject"
    t.string   "status"
    t.text     "messages"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
