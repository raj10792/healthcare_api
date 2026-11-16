class CreatePatientProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :patient_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_of_birth
      t.integer :gender
      t.string :blood_group
      t.text :address
      t.string :emergency_contact

      t.timestamps
    end
  end
end
