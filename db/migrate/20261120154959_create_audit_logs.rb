class CreateAuditLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :audit_logs do |t|
      t.references :user, foreign_key: true
      t.string :action
      t.string :auditable_type
      t.bigint :auditable_id
      t.string :ip_address
      t.jsonb :metadata

      t.timestamps
    end
  end
end
