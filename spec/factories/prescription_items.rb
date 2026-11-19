FactoryBot.define do
  factory :prescription_item do
    prescription { nil }
    medicine_name { "MyString" }
    dosage { "MyString" }
    frequency { "MyString" }
    duration { "MyString" }
    instructions { "MyText" }
  end
end
