class Api::V1::AppointmentsController < Api::V1::BaseController
    def show
        @appointment = Appointment.find(params[:id])

        authorize @appointment

        render json: @appointment
    end

    def create
        @appointment = Appointments::Create.new(
            patient: patient_profile,
            doctor: doctor_profile,
            clinic: clinic,
            params: appointment_params
        ).call

        render json: @appointment,
                status: :created
    end

    def update
        @appointment = Appointment.find(params[:id])

        authorize @appointment

        if @appointment.update(appointment_params)
        render json: @appointment
        else
        render json: {
            errors: @appointment.errors.full_messages
        }, status: :unprocessable_entity
        end
    end

    private

    def appointment_params
        params.require(:appointment).permit(
        :appointment_date, 
        :status,
        :reason
        )
    end
end
