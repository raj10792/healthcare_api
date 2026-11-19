class LabResult < ApplicationRecord
  belongs_to :lab_order

  has_one_attached :report_document

  validates :test_name, presence :true
end
