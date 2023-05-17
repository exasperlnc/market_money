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
      expect(response.status).to eq(200)

      market_vendor = MarketVendor.last

      expect(market_vendor.market_id).to eq(market_vendor_params[:market_id])
      expect(market_vendor.vendor_id).to eq(market_vendor_params[:vendor_id])
    end
  end
end