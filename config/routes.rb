Rails.application.routes.draw do
  post '/patients', to: 'patients#create'
  post '/consultation_requests', to: 'consultation_requests#create'
  post '/consultation_requests/:request_id/recommendations', to: 'recommendations#create'
  get '/patients/:patient_id/recommendations', to: 'recommendations#get_all_by_patient_id'
  
  get '/mock_data', to: 'mock_data#get_mock_data'
  get '/mock_data/analysis', to: 'mock_data#get_analysis'
end
