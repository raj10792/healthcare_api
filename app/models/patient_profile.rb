class PatientProfile < ApplicationRecord
  belongs_to :user

  has_many :appointments, dependent: :restrict_with_error
  has_many :medical_records, dependent: :restrict_with_error
  has_many :prescriptions, dependent: :restrict_with_error
  has_many :lab_orders, dependent: :restrict_with_error

  enum :gender, {
    male: 0,
    female: 1,
    other: 2
  }

  validates :date_of_birth, presence: true
end
