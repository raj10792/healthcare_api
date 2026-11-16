class DoctorProfile < ApplicationRecord
  belongs_to :user

  has_many :appointments, dependent: :restrict_with_error
  has_many :medical_records, dependent: :restrict_with_error
  has_many :prescriptions, dependent: :restrict_with_error

  validates :specialization, presence: true
end
