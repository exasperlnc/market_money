require 'rails_helper'

RSpec.describe "MarketVendors API" do
  describe 'creates marketvendor' do
    it 'happy path' do
      vendor = create(:vendor)
      market = create(:market)

      market_vendor_params = ({
        market_id: market.id,
        vendor_id: vendor.id
      })
      
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/market_vendors", headers: headers, params: JSON.generate(market_vendor: market_vendor_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      market_vendor = MarketVendor.last

      expect(market_vendor.market_id).to eq(market_vendor_params[:market_id])
      expect(market_vendor.vendor_id).to eq(market_vendor_params[:vendor_id])
    end

    it 'sad path' do
      vendor = create(:vendor)

      market_vendor_params = ({
        market_id: 123515,
        vendor_id: vendor.id
      })
      
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/market_vendors", headers: headers, params: JSON.generate(market_vendor: market_vendor_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
    end
  end

  describe 'deletes marketvendor' do
    it 'happy path' do
      vendor_1 = create(:vendor)
      market_1 = create(:market)

      vendor_2 = create(:vendor)
      market_2 = create(:market)

      market_vendor_params = ({
        market_id: market_1.id,
        vendor_id: vendor_1.id
      })

      MarketVendor.create(market_id: market_2.id, vendor_id: vendor_2.id)
      
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/market_vendors", headers: headers, params: JSON.generate(market_vendor: market_vendor_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      market_vendor = MarketVendor.last

      expect(market_vendor.market_id).to eq(market_vendor_params[:market_id])
      expect(market_vendor.vendor_id).to eq(market_vendor_params[:vendor_id])

      delete "/api/v0/market_vendors/#{MarketVendor.last.id}"

      last_market_vendor = MarketVendor.last
      expect(response).to be_successful

      expect(last_market_vendor.market_id).to_not eq(market_vendor_params[:market_id])
      expect(last_market_vendor.vendor_id).to_not eq(market_vendor_params[:vendor_id])
    end

    it 'sad path' do
      delete "/api/v0/market_vendors/2918818238834"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end