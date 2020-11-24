# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_24_143641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pot_id", null: false
    t.index ["pot_id"], name: "index_chatrooms_on_pot_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.string "contribution_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "session_id"
    t.bigint "user_id", null: false
    t.bigint "pot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pot_id"], name: "index_contributions_on_pot_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "gift_votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gift_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gift_id"], name: "index_gift_votes_on_gift_id"
    t.index ["user_id"], name: "index_gift_votes_on_user_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "pot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "price", default: 0
    t.index ["pot_id"], name: "index_gifts_on_pot_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pots", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.integer "min_amount", default: 1, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_amount", default: 0
    t.index ["user_id"], name: "index_pots_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_pots", force: :cascade do |t|
    t.bigint "pot_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pot_id"], name: "index_users_pots_on_pot_id"
    t.index ["user_id"], name: "index_users_pots_on_user_id"
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "chatrooms", "pots"
  add_foreign_key "contributions", "pots"
  add_foreign_key "contributions", "users"
  add_foreign_key "gift_votes", "gifts"
  add_foreign_key "gift_votes", "users"
  add_foreign_key "gifts", "pots"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "pots", "users"
  add_foreign_key "users_pots", "pots"
  add_foreign_key "users_pots", "users"
end
