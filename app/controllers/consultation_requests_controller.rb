class ConsultationRequestsController < ApplicationController

  def create

    consultation_request = ConsultationRequest.new(get_params)
    if consultation_request.save
      render json: {consultation_request_id: consultation_request.id}, status: 201
    else
      render json: {errors: consultation_request.errors}, status: unprocessable_entitty
    end
  end

  private
  def get_params
    params.require(:consultation_request).permit(:request_text, :request_date, :patient_id)
  end

end