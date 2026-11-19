class CreateLabOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :lab_orders do |t|
      t.references :patient_profile, null: false, foreign_key: true
      t.references :doctor_profile, null: false, foreign_key: true
      t.integer :status
      t.datetime :ordered_at

      t.timestamps
    end
  end
end
