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

ActiveRecord::Schema[7.0].define(version: 2023_06_15_165844) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_reservations", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_reservations_on_product_id"
    t.index ["reservation_id"], name: "index_product_reservations_on_reservation_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.bigint "user_id", null: false
    t.bigint "package_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["package_id"], name: "index_reservations_on_package_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "product_reservations", "products"
  add_foreign_key "product_reservations", "reservations"
  add_foreign_key "reservations", "packages"
  add_foreign_key "reservations", "users"
end
