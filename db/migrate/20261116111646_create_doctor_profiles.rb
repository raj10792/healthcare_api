class CreateDoctorProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :doctor_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :specialization
      t.string :qualification
      t.integer :experience_years
      t.decimal :consultation_fee

      t.timestamps
    end
  end
end
