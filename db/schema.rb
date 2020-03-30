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

ActiveRecord::Schema.define(version: 2020_03_27_214523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resumes", force: :cascade do |t|
    t.string "name"
    t.string "attachment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "contact_number"
    t.string "correspondence_address"
    t.string "correspondence_city"
    t.string "correspondence_state"
    t.string "correspondence_pincode"
    t.string "permanent_address"
    t.string "permanent_city"
    t.string "permanent_state"
    t.string "permanent_pincode"
    t.json "education"
    t.json "experience"
    t.json "certification"
    t.string "current_ctc"
    t.string "expected_ctc"
    t.string "notice_period"
    t.string "technical_skills"
    t.string "skill_set"
    t.string "responsibilities"
    t.string "linkedin_url"
    t.string "strengths"
    t.string "weaknesses"
    t.string "hobbies"
    t.string "achievments"
    t.string "professional_reference"
    t.date "birthday"
    t.boolean "gender"
    t.integer "passport_ability"
    t.string "passport_number"
    t.string "language"
    t.string "father_name"
    t.string "mother_name"
    t.string "blood_group"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
