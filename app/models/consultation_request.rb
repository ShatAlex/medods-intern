class ConsultationRequest < ApplicationRecord
  belongs_to :patient

  validates :request_text, presence: true
  validates :request_date, presence: true
end
