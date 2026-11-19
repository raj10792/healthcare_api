FactoryBot.define do
  factory :lab_order do
    patient_profile { nil }
    doctor_profile { nil }
    status { 1 }
    ordered_at { "2026-11-19 12:27:16" }
  end
end
