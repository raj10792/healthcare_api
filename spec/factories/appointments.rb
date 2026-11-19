FactoryBot.define do
  factory :appointment do
    clinic { nil }
    patient_profile { nil }
    doctor_profile { nil }
    appointment_date { "2026-11-16 12:21:42" }
    status { 1 }
    reason { "MyText" }
  end
end
