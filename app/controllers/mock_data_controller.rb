require 'faker'

require 'uri'
require 'net/http'
require 'json'


class MockDataController < ApplicationController

    def get_mock_data
        request_text = Faker::Quote.famous_last_words 
        render json: {data: request_text}, status: 200
    end

    def get_analysis

        uri = URI("https://api.adviceslip.com/advice")

        Net::HTTP.start(uri.host, uri.port, :use_ssl => true)  do |http|
          request = Net::HTTP::Get.new uri
  
          response = http.request request
          
          response_json = JSON.parse(response.read_body)
  
          analysis = response_json["slip"]["advice"]

          render json: {analysis: analysis}, status: 200
        
        end
    end
end
