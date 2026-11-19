class MedicalRecord < ApplicationRecord
  belongs_to :patient_profile
  belongs_to :doctor_profile
  
  has_many_attached :documents

  validates :diagnosis, presence: true
  validates :recorded_at, presence: true
end
