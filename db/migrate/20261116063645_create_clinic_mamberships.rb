class CreateClinicMamberships < ActiveRecord::Migration[8.1]
  def change
    create_table :clinic_mamberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clinic, null: false, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
