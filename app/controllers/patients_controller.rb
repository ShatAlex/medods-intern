class PatientsController < ApplicationController

  def create
    patient = Patient.new(get_params)
    if patient.save
      render json: {patient_id: patient.id}, status: 201
    else
      render json: {errors: patient.errors}, status: unprocessable_entitty
    end

  end

  private
    def get_params
      params.require(:patient).permit(:name, :surname, :patronymic, :birth_date, :phone, :email)
    end
    
end