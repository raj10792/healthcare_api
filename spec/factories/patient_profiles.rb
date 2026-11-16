FactoryBot.define do
  factory :patient_profile do
    user { nil }
    date_of_birth { "2026-11-16" }
    gender { 1 }
    blood_group { "MyString" }
    address { "MyText" }
    emergency_contact { "MyString" }
  end
end
