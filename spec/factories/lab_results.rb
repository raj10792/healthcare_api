FactoryBot.define do
  factory :lab_result do
    lab_order { nil }
    test_name { "MyString" }
    result_value { "MyString" }
    unit { "MyString" }
    reference_range { "MyString" }
    reported_at { "2026-11-19 12:31:27" }
  end
end
