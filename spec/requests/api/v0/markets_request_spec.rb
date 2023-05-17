require 'rails_helper'

RSpec.describe 'Markets API' do
  describe 'gets all markets' do
    it 'gets all the markets' do
      create_list(:market, 10)
    
      get '/api/v0/markets'
    
      expect(response).to be_successful
    
      data = JSON.parse(response.body, symbolize_names: true)
      
      markets = data[:data]
    
      markets.each do |market|
        attributes = market[:attributes]
        expect(market).to have_key(:id)

        expect(attributes).to have_key(:name)
        # expect(attributes.name).to be_a(String)

        expect(attributes).to have_key(:street)
        # expect(attributes.street).to be_a(String)

        expect(attributes).to have_key(:city)
        # expect(attributes.city).to be_a(String)

        expect(attributes).to have_key(:county)
        # expect(attributes.county).to be_a(String)

        expect(attributes).to have_key(:state)
        # expect(attributes.state).to be_a(String)

        expect(attributes).to have_key(:zip)
        # expect(attributes.zip).to be_a(String)

        expect(attributes).to have_key(:lat)
        # expect(attributes.lat).to be_a(String)

        expect(attributes).to have_key(:lon)
        # expect(attributes.lon).to be_a(String)
      end
    end
  end
  describe 'gets one market' do
    it 'happy path' do
      create_list(:market, 2)

      get "/api/v0/markets/#{Market.all.first.id}"

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)
      
      market = data[:data]

      expect(market).to have_key(:id)
      expect(market[:attributes]).to have_key(:name)
      expect(market[:attributes]).to have_key(:street)
      expect(market[:attributes]).to have_key(:city)
      expect(market[:attributes]).to have_key(:county)
      expect(market[:attributes]).to have_key(:state)
      expect(market[:attributes]).to have_key(:zip)
      expect(market[:attributes]).to have_key(:lat)
      expect(market[:attributes]).to have_key(:lon)
    end

    it 'sad path' do
      get "/api/v0/markets/129281817"

      data = JSON.parse(response.body, symbolize_names: true)

      error = data[:errors]

      expect(error).to eq("Couldn't find Market with 'id'=129281817")
    end
  end
end