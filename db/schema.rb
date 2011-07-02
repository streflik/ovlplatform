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

ActiveRecord::Schema.define(:version => 20110628112854) do

  create_table "channels", :force => true do |t|
    t.string   "name"
    t.string   "name_pl"
    t.text     "description"
    t.text     "description_pl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "accept_policy"
    t.text     "description"
    t.text     "description_pl"
    t.boolean  "is_admin",                              :default => false
    t.boolean  "is_teacher",                            :default => false
    t.boolean  "is_subscriber",                         :default => false
    t.integer  "credits_available",                     :default => 0
    t.integer  "credits_total",                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.string   "name"
    t.text     "description"
    t.string   "name_pl"
    t.text     "description_pl"
    t.text     "embed"
    t.string   "duration"
    t.boolean  "is_featured"
    t.boolean  "is_paid"
    t.integer  "price"
    t.integer  "days"
    t.string   "youtube"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
