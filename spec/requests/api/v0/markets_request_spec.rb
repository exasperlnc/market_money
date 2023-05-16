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

      data = JSON.parse(response.body, symbolize_names: true)

      error = data[:error]

      expect(error).to eq("Couldn't find Market with 'id'=1")
    end
  end
  describe 'gets all vendors for a market' do
    xit 'happy path' do
      test_data
      get "/api/v0/markets/55297/vendors"

      data = JSON.parse(response.body, symbolize_names: true)
      
      vendors = data[:data]

      vendors.each do |vendor|
        expect(vendor).to have_key(:id)
        expect(vendor[:attributes]).to have_key(name)
        expect(vendor[:attributes]).to have_key(description)
        expect(vendor[:attributes]).to have_key(contact_name)
        expect(vendor[:attributes]).to have_key(contact_phone)
        expect(vendor[:attributes]).to have_key(credit_accepted)
      end
    end

    xit 'sad path' do
      
    end
  end

  describe 'gets one vendor' do
    before :each do
      @market_1 = Market.create()
      @vendor_1 = @market_1.vendors.create(
        name: 'Vendor 1',
        description: 'Description 1',
        contact_name: 'Contact 1',
        contact_phone: '123-456-7890',
        credit_accepted: true
        )
    end
    it 'happy path' do

      get "/api/v0/vendors/#{@vendor_1.id}"
    end

    it 'sad path' do
      
    end
  end

end