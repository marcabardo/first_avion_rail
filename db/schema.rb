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

ActiveRecord::Schema[7.2].define(version: 2025_06_20_171646) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.string "section", limit: 10
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "role", limit: 45
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 100
    t.string "middle_name", limit: 100
    t.string "last_name", limit: 100
    t.integer "age"
    t.string "location", limit: 100
  end

  create_table "transactions", id: :serial, force: :cascade do |t|
    t.string "transaction_number", limit: 10
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "age"
  end

  create_table "users_roles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_foreign_key "classrooms", "students", name: "fk_student"
  add_foreign_key "users_roles", "roles", name: "fk_roles"
  add_foreign_key "users_roles", "users", name: "fk_users"
end
