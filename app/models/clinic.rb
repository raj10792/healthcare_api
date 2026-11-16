class Clinic < ApplicationRecord
    has_many :clinic_memberships, dependent: :destroy
    has_many :users, through: :clinic_memberships
    has_many :appointments, dependent: :destroy
end
