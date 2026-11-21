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

ActiveRecord::Schema[8.1].define(version: 2026_11_20_154959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token_digest"
    t.datetime "expire_at"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_access_tokens_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "patient_profile_id", null: false
    t.bigint "doctor_profile_id", null: false
    t.datetime "appointment_date"
    t.integer "status"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["doctor_profile_id", "appointment_date"], name: "index_active_appointments_on_doctor_and_time", unique: true, where: "(status = ANY (ARRAY[0, 1]))"
    t.index ["doctor_profile_id"], name: "index_appointments_on_doctor_profile_id"
    t.index ["patient_profile_id"], name: "index_appointments_on_patient_profile_id"
  end

  create_table "audit_logs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "action"
    t.string "auditable_type"
    t.bigint "auditable_id"
    t.string "ip_address"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_audit_logs_on_user_id"
  end

  create_table "clinic_mamberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "clinic_id", null: false
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_clinic_mamberships_on_clinic_id"
    t.index ["user_id"], name: "index_clinic_mamberships_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctor_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "specialization"
    t.string "qualification"
    t.integer "experience_years"
    t.decimal "consultation_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctor_profiles_on_user_id"
  end

  create_table "lab_orders", force: :cascade do |t|
    t.bigint "patient_profile_id", null: false
    t.bigint "doctor_profile_id", null: false
    t.integer "status"
    t.datetime "ordered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_profile_id"], name: "index_lab_orders_on_doctor_profile_id"
    t.index ["patient_profile_id"], name: "index_lab_orders_on_patient_profile_id"
  end

  create_table "lab_results", force: :cascade do |t|
    t.bigint "lab_order_id", null: false
    t.string "test_name"
    t.string "result_value"
    t.string "unit"
    t.string "reference_range"
    t.datetime "reported_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_order_id"], name: "index_lab_results_on_lab_order_id"
  end

  create_table "medical_records", force: :cascade do |t|
    t.bigint "patient_profile_id", null: false
    t.bigint "doctor_profile_id", null: false
    t.text "diagnosis"
    t.text "notes"
    t.datetime "recorded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_profile_id"], name: "index_medical_records_on_doctor_profile_id"
    t.index ["patient_profile_id"], name: "index_medical_records_on_patient_profile_id"
  end

  create_table "patient_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date_of_birth"
    t.integer "gender"
    t.string "blood_group"
    t.text "address"
    t.string "emergency_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patient_profiles_on_user_id"
  end

  create_table "prescription_items", force: :cascade do |t|
    t.bigint "prescription_id", null: false
    t.string "medicine_name"
    t.string "dosage"
    t.string "frequency"
    t.string "duration"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prescription_id"], name: "index_prescription_items_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "patient_profile_id", null: false
    t.bigint "doctor_profile_id", null: false
    t.bigint "medical_record_id"
    t.datetime "prescribed_at"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_profile_id"], name: "index_prescriptions_on_doctor_profile_id"
    t.index ["medical_record_id"], name: "index_prescriptions_on_medical_record_id"
    t.index ["patient_profile_id"], name: "index_prescriptions_on_patient_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "access_tokens", "users"
  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "doctor_profiles"
  add_foreign_key "appointments", "patient_profiles"
  add_foreign_key "audit_logs", "users"
  add_foreign_key "clinic_mamberships", "clinics"
  add_foreign_key "clinic_mamberships", "users"
  add_foreign_key "doctor_profiles", "users"
  add_foreign_key "lab_orders", "doctor_profiles"
  add_foreign_key "lab_orders", "patient_profiles"
  add_foreign_key "lab_results", "lab_orders"
  add_foreign_key "medical_records", "doctor_profiles"
  add_foreign_key "medical_records", "patient_profiles"
  add_foreign_key "patient_profiles", "users"
  add_foreign_key "prescription_items", "prescriptions"
  add_foreign_key "prescriptions", "doctor_profiles"
  add_foreign_key "prescriptions", "medical_records"
  add_foreign_key "prescriptions", "patient_profiles"
end
