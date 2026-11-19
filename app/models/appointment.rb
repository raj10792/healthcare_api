class Appointment < ApplicationRecord
  belongs_to :clinic
  belongs_to :patient_profile
  belongs_to :doctor_profile

  enum :status, {
    pending: 0,
    confirmed: 1,
    completed: 2,
    cancelled: 3
  }

  validates :appointment_date, presence: true
  validates :reason, presence: true

  validate :appointment_date_must_be_future

  private
  
  def appointment_date_must_be_future
    return if appointment_date.blank?

    if appointment_date <= Time.current
      errors.add(:appointment_date, "must be in the future")
    end 
  end
end
 