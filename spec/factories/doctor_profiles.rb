FactoryBot.define do
  factory :doctor_profile do
    user { nil }
    specialization { "MyString" }
    qualification { "MyString" }
    experience_years { 1 }
    consultation_fee { "9.99" }
  end
end
