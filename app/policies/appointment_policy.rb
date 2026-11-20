class AppointmentPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    admin? ||
      receptionist? ||
      own_patient_appointment? ||
      assigned_doctor?
  end

  def create?
    admin? ||
      receptionist? ||
      own_patient?
  end

  def update?
    admin? ||
      receptionist? ||
      assigned_doctor?
  end

  def destroy?
    admin? || receptionist?
  end

  private

  def admin?
    ClinicMembership.exists?(
      user: user,
      clinic_id: record.clinic_id,
      role: :admin
    )
  end

  def receptionist?
    ClinicMembership.exists?(
      user: user,
      clinic_id: record.clinic_id,
      role: :receptionist
    )
  end

  def own_patient?
    record.patient_profile.user_id == user.id
  end

  def own_patient_appointment?
    record.patient_profile.user_id == user.id
  end

  def assigned_doctor?
    record.doctor_profile.user_id == user.id
  end
end