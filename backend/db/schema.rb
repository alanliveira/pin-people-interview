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

ActiveRecord::Schema[8.1].define(version: 2026_02_17_014308) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.bigint "question_id", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "company_roles", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_roles_on_company_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "area_level_4_id", null: false
    t.bigint "company_id", null: false
    t.bigint "company_level_0_id", null: false
    t.string "company_tenure"
    t.bigint "coordination_level_3_id", null: false
    t.string "corporate_email"
    t.bigint "departament_id", null: false
    t.bigint "directorate_level_1_id", null: false
    t.string "email"
    t.bigint "function_id", null: false
    t.string "genedr"
    t.string "geration"
    t.string "location"
    t.bigint "management_level_2_id", null: false
    t.string "name"
    t.string "phone_number"
    t.bigint "position_id", null: false
    t.index ["area_level_4_id"], name: "index_employees_on_area_level_4_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["company_level_0_id"], name: "index_employees_on_company_level_0_id"
    t.index ["coordination_level_3_id"], name: "index_employees_on_coordination_level_3_id"
    t.index ["departament_id"], name: "index_employees_on_departament_id"
    t.index ["directorate_level_1_id"], name: "index_employees_on_directorate_level_1_id"
    t.index ["function_id"], name: "index_employees_on_function_id"
    t.index ["management_level_2_id"], name: "index_employees_on_management_level_2_id"
    t.index ["position_id"], name: "index_employees_on_position_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.string "type"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_questions_on_company_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "employee_id", null: false
    t.bigint "question_id", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_surveys_on_employee_id"
    t.index ["question_id"], name: "index_surveys_on_question_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "company_roles", "companies"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "company_roles", column: "area_level_4_id"
  add_foreign_key "employees", "company_roles", column: "company_level_0_id"
  add_foreign_key "employees", "company_roles", column: "coordination_level_3_id"
  add_foreign_key "employees", "company_roles", column: "departament_id"
  add_foreign_key "employees", "company_roles", column: "directorate_level_1_id"
  add_foreign_key "employees", "company_roles", column: "function_id"
  add_foreign_key "employees", "company_roles", column: "management_level_2_id"
  add_foreign_key "employees", "company_roles", column: "position_id"
  add_foreign_key "questions", "companies"
  add_foreign_key "surveys", "employees"
  add_foreign_key "surveys", "questions"
end
