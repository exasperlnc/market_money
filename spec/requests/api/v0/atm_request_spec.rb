require 'rails_helper'

RSpec.describe "ATM API" do
  describe 'gets close atm' do
    it 'gets all the close atms' do
      provo_market = Market.create(
        name: "Provo Farmers Market",
        street: "500 w Center Street",
        city: "Provo",
        county: "Utah",
        state: "Utah",
        zip: "84606",
        lat: 40.2331,
        lon: -111.6683
      )

      get "/api/v0/markets/#{provo_market.id}/nearest_atm"
    end

    it 'sad path' do
      get "/api/v0/markets/2985818127/nearest_atm"

      expect(response).to_not be_successful
    end
  end
end