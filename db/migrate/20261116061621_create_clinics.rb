class CreateClinics < ActiveRecord::Migration[8.1]
  def change
    create_table :clinics do |t|
      t.string :name
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end
