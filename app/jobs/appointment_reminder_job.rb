class AppointmentReminderJob < ApplicationJob
  queue_as :default

  def perform(appointment_id)
    appointment = Appointment.find_by(
      id: appointment_id
    )

    return unless appointment&.confirmed?

    AppointmentMailer.reminder(appointment).deliver_now
  end
end
