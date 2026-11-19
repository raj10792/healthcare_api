class CreateLabResults < ActiveRecord::Migration[8.1]
  def change
    create_table :lab_results do |t|
      t.references :lab_order, null: false, foreign_key: true
      t.string :test_name
      t.string :result_value
      t.string :unit
      t.string :reference_range
      t.datetime :reported_at

      t.timestamps
    end
  end
end
