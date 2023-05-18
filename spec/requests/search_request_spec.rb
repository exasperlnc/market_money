require 'rails_helper'

RSpec.describe "Search API" do
  describe "happy path" do
    
  end


  describe "sad path" do
    it 'searches for only city' do
      search_params = ({
        city: 'Canada'
      })

      get '/api/v0/markets/search', params: JSON.generate(params: search_params)

      require 'pry'; binding.pry
      expect(response).to be_successful
    end
  end
end