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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151211025358) do

  create_table "comments", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "user_id",      limit: 4
    t.integer  "micropots_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "comments", ["micropots_id"], name: "index_comments_on_micropots_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "like_models", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "micropot_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "like_models", ["micropot_id"], name: "index_like_models_on_micropot_id", using: :btree

  create_table "like_pros", force: :cascade do |t|
    t.integer  "micropot_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "like_pros", ["micropot_id"], name: "index_like_pros_on_micropot_id", using: :btree
  add_index "like_pros", ["user_id"], name: "index_like_pros_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "micropot_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "likes", ["micropot_id"], name: "index_likes_on_micropot_id", using: :btree

  create_table "micropots", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture",    limit: 255
    t.integer  "likecount",  limit: 4,     default: 0
  end

  add_index "micropots", ["user_id", "created_at"], name: "index_micropots_on_user_id_and_created_at", using: :btree
  add_index "micropots", ["user_id"], name: "index_micropots_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "like_models", "micropots"
  add_foreign_key "like_pros", "micropots"
  add_foreign_key "like_pros", "users"
  add_foreign_key "likes", "micropots"
  add_foreign_key "micropots", "users"
end
