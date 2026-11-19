class User < ApplicationRecord
    has_secure_password

    has_many :access_tokens, dependent: :destroy
    has_many :clinic_memberships, dependent: :destroy
    has_many :audit_logs, dependent: :nullify

    has_one :patient_profile, dependent: :destroy
    has_one :doctor_profile, dependent: :destroy

    has_many :access_tokens, dependent: :destroy
    
    validates :name, presence: true

    validates :email, presence: true, uniqueness: true

    normalizes :email, with: ->(email){
        email.strip.downcase
    }

    normalizes :name, with: ->(email){
        name.strip
    }
end
