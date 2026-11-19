FactoryBot.define do
  factory :prescription do
    patient_profile { nil }
    doctor_profile { nil }
    medical_record { nil }
    prescribed_at { "2026-11-19 10:31:31" }
    notes { "MyText" }
  end
end
