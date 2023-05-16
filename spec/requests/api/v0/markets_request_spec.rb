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

    xit 'sad path' do
      get "/api/v0/markets/1"

      expect(response).to be_successful

      data = JSON.parse(response.body, symbolize_names: true)
      
      market = data[:data]
    end
  end
  describe 'gets all vendors for a market' do
    before :each do
      @market_1 = Market.new(id:1)
      @vendor_1 = Vendor.new(
        # id: 1,
        name: 'Vendor 1',
        description: 'Description 1',
        contact_name: 'Contact 1',
        contact_phone: '123-456-7890',
        credit_accepted: true
        )
      @vendor_2 = Vendor.new(
        # id: 2,
        name: 'Vendor 2',
        description: 'Description 2',
        contact_name: 'Contact 2',
        contact_phone: '223-456-7890',
        credit_accepted: true
        )
      @vendor_3 = Vendor.new(
        # id: 3,  
        name: 'Vendor 3',
        description: 'Description 3',
        contact_name: 'Contact 3',
        contact_phone: '323-456-7890',
        credit_accepted: true
        )
      @market_vendor_1 = MarketVendor.new(market_id: @market_1.id, vendor_id: @vendor_1.id)
      @market_vendor_2 = MarketVendor.new(market_id: @market_1.id, vendor_id: @vendor_2.id)
    end
    # let(:market_1) { Market.new(id:1)}
    # let(:vendor_1) {Vendor.new(
    #                            id: 1,
    #                            name: 'Vendor 1',
    #                            description: 'Description 1',
    #                            contact_name: 'Contact 1',
    #                            contact_phone: '123-456-7890',
    #                            credit_accepted: true
    #                            )}
    #   let(:vendor_2) {Vendor.new(
    #                             id: 2,
    #                             name: 'Vendor 2',
    #                             description: 'Description 2',
    #                             contact_name: 'Contact 2',
    #                             contact_phone: '223-456-7890',
    #                             credit_accepted: true
    #                             )}
    # let(:vendor_3) {Vendor.new(
    #                               id: 3,  
    #                               name: 'Vendor 3',
    #                               description: 'Description 3',
    #                               contact_name: 'Contact 3',
    #                               contact_phone: '323-456-7890',
    #                               credit_accepted: true
    #                               )}
    # let(:market_vendor_1) { MarketVendor.new(market_id: market_1.id, vendor_id: vendor_1.id)}
    # let(:market_vendor_2) { MarketVendor.new(market_id: market_2.id, vendor_id: vendor_2.id)}
    it 'happy path' do
      require 'pry'; binding.pry
      get "/api/v0/markets/#{@market_1.id}/vendors}"

      expect(response).to be_successful

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

end