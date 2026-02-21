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

ActiveRecord::Schema[8.1].define(version: 2026_02_21_144235) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "company_roles", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.string "role_type"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_roles_on_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "company_department_id", null: false
    t.bigint "company_function_id", null: false
    t.bigint "company_id", null: false
    t.bigint "company_position_id", null: false
    t.string "company_tenure"
    t.string "corporate_email"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "gender"
    t.string "generation"
    t.bigint "level_area_id", null: false
    t.bigint "level_coordination_id", null: false
    t.bigint "level_directorate_id", null: false
    t.bigint "level_management_id", null: false
    t.string "location"
    t.string "name"
    t.string "phone_number"
    t.datetime "updated_at", null: false
    t.index ["company_department_id"], name: "index_employees_on_company_department_id"
    t.index ["company_function_id"], name: "index_employees_on_company_function_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["company_position_id"], name: "index_employees_on_company_position_id"
    t.index ["level_area_id"], name: "index_employees_on_level_area_id"
    t.index ["level_coordination_id"], name: "index_employees_on_level_coordination_id"
    t.index ["level_directorate_id"], name: "index_employees_on_level_directorate_id"
    t.index ["level_management_id"], name: "index_employees_on_level_management_id"
  end

  add_foreign_key "company_roles", "companies"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "company_roles", column: "company_department_id"
  add_foreign_key "employees", "company_roles", column: "company_function_id"
  add_foreign_key "employees", "company_roles", column: "company_position_id"
  add_foreign_key "employees", "company_roles", column: "level_area_id"
  add_foreign_key "employees", "company_roles", column: "level_coordination_id"
  add_foreign_key "employees", "company_roles", column: "level_directorate_id"
  add_foreign_key "employees", "company_roles", column: "level_management_id"
end
