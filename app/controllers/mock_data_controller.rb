require 'faker'

require 'uri'
require 'net/http'
require 'json'


class MockDataController < ApplicationController

    def get_unii

        uri = URI("https://api.fda.gov/other/unii.json?limit=1000")

        Net::HTTP.start(uri.host, uri.port, :use_ssl => true)  do |http|
            request = Net::HTTP::Get.new uri
    
            response = http.request request
            
            response_json = JSON.parse(response.read_body)
    
            data = response_json['results'][Random.rand(999)]['unii']

            render json: {data: data}, status: 200
            
        end
    end

    def get_analysis

        url = "https://api.fda.gov/other/unii.json?search=unii:"+params[:data]

        uri = URI(url)

        Net::HTTP.start(uri.host, uri.port, :use_ssl => true)  do |http|
            request = Net::HTTP::Get.new uri
    
            response = http.request request
            
            response_json = JSON.parse(response.read_body)

            analysis = response_json["results"][0]['substance_name']

            render json: {analysis: analysis}, status: 200
            
        end
    end

end
