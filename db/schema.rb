# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_12_175154) do
  create_table "addresses", force: :cascade do |t|
    t.string "zip_code"
    t.string "full_address"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deadline_configs", force: :cascade do |t|
    t.integer "transport_type_id", null: false
    t.integer "minimum_range"
    t.integer "maximum_range"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_type_id"], name: "index_deadline_configs_on_transport_type_id"
  end

  create_table "distance_configs", force: :cascade do |t|
    t.integer "transport_type_id", null: false
    t.integer "minimum_range"
    t.integer "maximum_range"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_type_id"], name: "index_distance_configs_on_transport_type_id"
  end

  create_table "transport_types", force: :cascade do |t|
    t.string "name"
    t.integer "minimum_distance"
    t.integer "maximum_distance"
    t.integer "minimum_weight"
    t.integer "maximum_weight"
    t.integer "flat_hate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "transport_type_id", null: false
    t.string "license_plate"
    t.string "brand"
    t.string "model"
    t.string "manufacture_year"
    t.string "maximum_load_capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["transport_type_id"], name: "index_vehicles_on_transport_type_id"
  end

  create_table "weight_configs", force: :cascade do |t|
    t.integer "transport_type_id", null: false
    t.integer "minimum_range"
    t.integer "maximum_range"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_type_id"], name: "index_weight_configs_on_transport_type_id"
  end

  add_foreign_key "deadline_configs", "transport_types"
  add_foreign_key "distance_configs", "transport_types"
  add_foreign_key "vehicles", "transport_types"
  add_foreign_key "weight_configs", "transport_types"
end
