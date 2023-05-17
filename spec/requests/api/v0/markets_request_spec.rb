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
  describe 'gets all vendors for a market' do
    it 'happy path' do
      market_1 = create(:market)

      vendor_1 = create(:vendor)
      vendor_2 = create(:vendor)

      # MarketVendor.create(market_id: market_1.id, vendor_id: vendor_1.id)
      # MarketVendor.create(market_id: market_1.id, vendor_id: vendor_2.id)

      get "/api/v0/markets/#{market_1.id}/vendors"

      data = JSON.parse(response.body, symbolize_names: true)
      
      vendors = data[:data]

      
      vendors.each do |vendor|
        attributes = vendor[:attributes]
        expect(vendor).to have_key(:id)
        expect(attributes).to have_key(name)
        expect(attributes.name).to be_a(String)
        
        expect(attributes).to have_key(description)
        expect(attributes.description).to be_a(String)

        expect(attributes).to have_key(contact_name)
        expect(attributes.contact_name).to be_a(String)

        expect(attributes).to have_key(contact_phone)
        expect(attributes.description).to be_a(String)

        expect(attributes).to have_key(credit_accepted)
        expect(attributes.credit_accepted).to be_a(Boolean)

      end
    end

    it 'sad path' do
      get "/api/v0/markets/1231231231/vendors"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)

    end
  end

  describe 'gets one vendor' do
    it 'happy path' do
      vendor_1 = create(:vendor)

      get "/api/v0/vendors/#{vendor_1.id}"
    end

    it 'sad path' do
      get "/api/v0/vendors/12398591"
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end

  describe 'creates a vendor' do
    xit 'happy path' do
      #set up params to send to create method
      post '/api/v0/vendors'

      expect(response).to be_successful
      
    end
  end
end