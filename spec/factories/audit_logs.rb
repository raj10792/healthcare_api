FactoryBot.define do
  factory :audit_log do
    user { nil }
    action { "MyString" }
    auditable_type { "MyString" }
    auditable_id { "" }
    ip_address { "MyString" }
    metadata { "" }
  end
end
