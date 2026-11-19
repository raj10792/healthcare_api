class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :patient_profile, null: false, foreign_key: true
      t.references :doctor_profile, null: false, foreign_key: true
      t.datetime :appointment_date
      t.integer :status
      t.text :reason

      t.timestamps
    end
    add_index :appointments, [:doctor_profile_id, :appointment_date], unique: true, where: "status IN (0, 1)", name: "index_active_appointments_on_doctor_and_time"
  end
end
