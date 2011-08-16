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

ActiveRecord::Schema.define(:version => 20110728112854) do

  create_table "channels", :force => true do |t|
    t.string   "name_en"
    t.string   "name_pl"
    t.string   "tagline_en"
    t.string   "tagline_pl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.string   "invoice_first_name"
    t.string   "invoice_last_name"
    t.string   "invoice_street"
    t.string   "invoice_postal_code"
    t.string   "invoice_city"
    t.integer  "credits"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unlocks", :force => true do |t|
    t.integer  "video_id"
    t.integer  "user_id"
    t.integer  "teacher_id"
    t.integer  "credits"
    t.integer  "commission"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unlocks", ["user_id", "video_id"], :name => "index_unlocks_on_user_id_and_video_id"
  add_index "unlocks", ["user_id"], :name => "index_unlocks_on_user_id"

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
    t.text     "description_en"
    t.text     "description_pl"
    t.string   "tagline_en"
    t.string   "tagline_pl"
    t.boolean  "is_admin",                              :default => false
    t.boolean  "is_teacher",                            :default => false
    t.boolean  "is_subscriber",                         :default => false
    t.integer  "credits_available",                     :default => 0
    t.integer  "credits_total",                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.string   "name_en"
    t.string   "name_pl"
    t.text     "description_en"
    t.text     "description_en_paid"
    t.text     "description_pl"
    t.text     "description_pl_paid"
    t.text     "summary_en"
    t.text     "summary_pl"
    t.integer  "duration"
    t.boolean  "is_featured"
    t.boolean  "is_paid"
    t.integer  "price"
    t.integer  "days"
    t.integer  "commission"
    t.string   "paid_video_sd"
    t.string   "paid_video_hd"
    t.string   "paid_video_iphone"
    t.string   "youtube_video"
    t.integer  "level"
    t.string   "native"
    t.boolean  "has_pl_captions"
    t.boolean  "has_en_captions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumb_file_name"
    t.string   "thumb_content_type"
    t.integer  "thumb_file_size"
    t.datetime "thumb_updated_at"
    t.text     "chapters_pl"
    t.text     "chapters_en"
  end

end
