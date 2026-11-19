FactoryBot.define do
  factory :medical_record do
    patient_profile { nil }
    doctor_profile { nil }
    diagnosis { "MyText" }
    notes { "MyText" }
    recorded_at { "2026-11-19 10:14:21" }
  end
end
