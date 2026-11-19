class LabOrder < ApplicationRecord
  belongs_to :patient_profile
  belongs_to :doctor_profile

  has_many :lab_results, dependent: :destroy

  enum :status, {
    pending: 0,
    processing: 1,
    completed: 2,
    cancelled: 3
  }
end
