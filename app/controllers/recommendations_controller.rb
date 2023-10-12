class RecommendationsController < ApplicationController

  def create
    
    recommendation = Recommendation.new do |r|
      r.recommend_text = params[:recommendation][:recommendation_text]
      r.consultation_request_id = params[:request_id]
    end
    

    if recommendation.save
      render json: {recommendation_id: recommendation.id}, status: 201
    else
      render json: {errors: recommendation.errors}, status: unprocessable_entitty
    end

    patient_id = ConsultationRequest.where(id: params[:request_id]).pluck(:patient_id)
    @patient = Patient.find_by(id: patient_id)
    @request_text = ConsultationRequest.where(id: params[:request_id]).pluck(:request_text)
    RecommendationMailer.with(
      patient: @patient, recommend_text:params[:recommendation][:recommendation_text], request_text: @request_text).
      recommendation_natification.deliver_later

  end

  def get_all_by_patient_id
    consultation_requests = ConsultationRequest.select('id').where(patient_id: params[:patient_id])
    recommendations = Recommendation.where("consultation_request_id IN (?)", consultation_requests)
    render json: {recommendations: recommendations}, status: 200
  end

  
end