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

ActiveRecord::Schema.define(:version => 20130601094106) do

  create_table "answers", :force => true do |t|
    t.string   "input"
    t.integer  "registration_id"
    t.integer  "question_id"
    t.string   "type"
    t.integer  "position"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["registration_id"], :name => "index_answers_on_registration_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.boolean  "locked"
    t.integer  "questions_count"
    t.integer  "max_registration_count"
    t.date     "expiry"
    t.integer  "user_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.integer  "position"
    t.integer  "event_id"
    t.string   "options"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["event_id"], :name => "index_questions_on_event_id"

  create_table "registrations", :force => true do |t|
    t.string   "email"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "registrations", ["event_id"], :name => "index_registrations_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
