class Prescription < ApplicationRecord
  belongs_to :patient_profile
  belongs_to :doctor_profile
  belongs_to :medical_record, optional: true

  has_many :precision_items, dependent: :destroy
  accepts_nested_attributes_for :precision_items, reject_if: :all_blank, allow_destroy: true

  validates :prescribed_at, presence: true
end
