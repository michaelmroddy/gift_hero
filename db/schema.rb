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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161209070053) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "gift_occasion_types", force: :cascade do |t|
    t.string   "occasion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gift_occasions", force: :cascade do |t|
    t.integer  "occasion_type_id"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.float    "budget"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gift_receivers", force: :cascade do |t|
    t.string   "name"
    t.integer  "relation_id"
    t.integer  "user_id"
    t.boolean  "male"
    t.integer  "age"
    t.string   "address"
    t.date     "birthday"
    t.date     "anniversary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gift_recommendations", force: :cascade do |t|
    t.string   "gift"
    t.string   "cost"
    t.string   "url"
    t.integer  "occasion_id"
    t.boolean  "selected"
    t.integer  "rating"
    t.integer  "recommender_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rejected"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "interest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receiver_interests", force: :cascade do |t|
    t.integer  "interest_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relation_types", force: :cascade do |t|
    t.string   "relation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "review_comments", force: :cascade do |t|
    t.integer  "recommendation_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.integer  "role_id"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
