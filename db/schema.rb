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

ActiveRecord::Schema.define(:version => 20110226081903) do

  create_table "arrangements", :force => true do |t|
    t.integer  "issue_id"
    t.integer  "section_id"
    t.integer  "article_id",     :null => false
    t.integer  "publication_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title",                                                       :null => false
    t.integer  "author_id",                                                   :null => false
    t.text     "abstract"
    t.text     "content",            :limit => 2147483647,                    :null => false
    t.text     "notes"
    t.text     "cited_works"
    t.text     "excerpt"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_textiled",                              :default => false
  end

  create_table "assignments", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.integer "publication_id"
  end

  create_table "authors", :force => true do |t|
    t.string   "name",           :null => false
    t.integer  "publication_id", :null => false
    t.string   "email"
    t.string   "url"
    t.string   "affiliation"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "issues", :force => true do |t|
    t.string   "title",                               :null => false
    t.integer  "volume"
    t.integer  "issue_number"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_published",     :default => false
    t.date     "publication_date"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.string   "author"
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "subtitle"
    t.string   "name",        :null => false
    t.text     "welcome"
    t.string   "copyright"
    t.string   "issn"
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "people"
    t.text     "submissions"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name",                              :null => false
    t.integer  "publication_id",                    :null => false
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_static",      :default => false
  end

  create_table "site_pages", :force => true do |t|
    t.string   "title",                                                   :null => false
    t.text     "content",        :limit => 2147483647
    t.integer  "publication_id",                                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_published",                         :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",                            :default => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
