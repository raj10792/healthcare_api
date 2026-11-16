class ClinicMambership < ApplicationRecord
  belongs_to :user
  belongs_to :clinic

  enum :role, {
    admin: 0,
    doctor: 1,
    receptionist: 2,
    patient: 3 
  }

  validates :role, presence: true

  validates :user_id, uniqueness: { scope: :clinic_id }
end
