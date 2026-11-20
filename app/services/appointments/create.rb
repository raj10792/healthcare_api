module Appointments
  class Create

    def initialize(patient:, doctor:, clinic:, params:)
      @patient = patient
      @doctor = doctor
      @clinic = clinic
      @params = params
    end

    def call
      appointment = nil

      Appointment.transaction do
        appointment = Appointment.create!(
          patient_profile: @patient,
          doctor_profile: @doctor,
          clinic: @clinic,
          appointment_date: @params[:appointment_date],
          reason: @params[:reason],
          status: :confirmed
        )
      end

      AppointmentConfirmationJob.perform_later(
        appointment.id
      )

      appointment
    end

  end
end