require 'rails_helper'

RSpec.describe 'Markets API' do
  describe 'gets all markets' do
    it 'gets all the markets' do
      create_list(:market, 10)
    
      get '/api/v0/markets'
    
      expect(response).to be_successful
    
      data = JSON.parse(response.body, symbolize_names: true)
      markets = data[:data]
      expect(markets.count).to eq(10)
    
      markets.each do |market|
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
    end
  end
  describe 'gets one market' do
    it 'happy paht' do
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
      get "/api/v0/markets/1"

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)
      
      market = data[:data]
    end
  end
end