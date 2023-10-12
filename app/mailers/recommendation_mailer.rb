class RecommendationMailer < ApplicationMailer
  def recommendation_natification
    @patient = params[:patient]
    @recommend_text = params[:recommend_text]
    @request_text = params[:request_text]
    mail to: @patient.email, subject: 'New recommendation for your request | Medods'
  end
end
