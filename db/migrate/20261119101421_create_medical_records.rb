class CreateMedicalRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :medical_records do |t|
      t.references :patient_profile, null: false, foreign_key: true
      t.references :doctor_profile, null: false, foreign_key: true
      t.text :diagnosis
      t.text :notes
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
