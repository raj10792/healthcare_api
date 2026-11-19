class CreatePrescriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :prescriptions do |t|
      t.references :patient_profile, null: false, foreign_key: true
      t.references :doctor_profile, null: false, foreign_key: true
      t.references :medical_record, foreign_key: true
      t.datetime :prescribed_at
      t.text :notes

      t.timestamps
    end
  end
end
