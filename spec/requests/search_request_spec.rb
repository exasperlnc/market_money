require 'rails_helper'

RSpec.describe "Search API" do
  describe "happy path" do
    describe 'searches for city and state' do
      it 'finds market' do
        market_1 = create(:market, name: "Jim's Market",
                          state: "North Carolina",
                          city: "I don't know any NC cities")
      
        search_params = ({
          city: "I don't know any NC cities",
          state: 'North Carolina'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]
      
        markets.each do |market|
          attributes = market[:attributes]
          expect(market).to have_key(:id)

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:street)
          expect(attributes[:street]).to be_a(String)

          expect(attributes).to have_key(:city)
          expect(attributes[:city]).to be_a(String)

          expect(attributes).to have_key(:county)
          expect(attributes[:county]).to be_a(String)

          expect(attributes).to have_key(:state)
          expect(attributes[:state]).to be_a(String)

          expect(attributes).to have_key(:zip)
          expect(attributes[:zip]).to be_a(String)

          expect(attributes).to have_key(:lat)
          expect(attributes[:lat]).to be_a(String)

          expect(attributes).to have_key(:lon)
          expect(attributes[:lon]).to be_a(String)
        end
      end

      it 'does not find market' do
        search_params = ({
          city: "I don't know any NC cities",
          state: 'North Carolina'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response[:status])

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]

        expect(markets).to eq([])
      end
    end

    describe 'searches for name and state' do
      it 'finds market' do
        market_1 = create(:market, name: "Jim's Market",
                          state: "North Carolina",
                          city: "I don't know any NC cities")
      
        search_params = ({
          name: "Jim",
          state: 'North Carolina'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]
      
        markets.each do |market|
          attributes = market[:attributes]
          expect(market).to have_key(:id)

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:street)
          expect(attributes[:street]).to be_a(String)

          expect(attributes).to have_key(:city)
          expect(attributes[:city]).to be_a(String)

          expect(attributes).to have_key(:county)
          expect(attributes[:county]).to be_a(String)

          expect(attributes).to have_key(:state)
          expect(attributes[:state]).to be_a(String)

          expect(attributes).to have_key(:zip)
          expect(attributes[:zip]).to be_a(String)

          expect(attributes).to have_key(:lat)
          expect(attributes[:lat]).to be_a(String)

          expect(attributes).to have_key(:lon)
          expect(attributes[:lon]).to be_a(String)
        end
      end

      it 'does not find market' do
        search_params = ({
          name: "Jim",
          state: 'North Carolina'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response[:status])

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]

        expect(markets).to eq([])
      end
    end

    describe 'searches for state' do
      it 'finds market' do
        market_1 = create(:market, name: "Jim's Market",
                          state: "North Carolina",
                          city: "I don't know any NC cities")
      
        search_params = ({
          state: 'North Carolina'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]
      
        markets.each do |market|
          attributes = market[:attributes]
          expect(market).to have_key(:id)

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:street)
          expect(attributes[:street]).to be_a(String)

          expect(attributes).to have_key(:city)
          expect(attributes[:city]).to be_a(String)

          expect(attributes).to have_key(:county)
          expect(attributes[:county]).to be_a(String)

          expect(attributes).to have_key(:state)
          expect(attributes[:state]).to be_a(String)

          expect(attributes).to have_key(:zip)
          expect(attributes[:zip]).to be_a(String)

          expect(attributes).to have_key(:lat)
          expect(attributes[:lat]).to be_a(String)

          expect(attributes).to have_key(:lon)
          expect(attributes[:lon]).to be_a(String)
        end
      end

      it 'does not find market' do
        search_params = ({
          state: 'North Carolina'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response[:status])

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]

        expect(markets).to eq([])
      end
    end

    describe 'searches for state, city and name' do
      it 'finds market' do
        market_1 = create(:market, name: "Jim's Market",
                          state: "North Carolina",
                          city: "I don't know any NC cities")
      
        search_params = ({
          city: "I don't know any NC cities",
          state: 'North Carolina',
          name: 'Jim'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]
      
        markets.each do |market|
          attributes = market[:attributes]
          expect(market).to have_key(:id)

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:street)
          expect(attributes[:street]).to be_a(String)

          expect(attributes).to have_key(:city)
          expect(attributes[:city]).to be_a(String)

          expect(attributes).to have_key(:county)
          expect(attributes[:county]).to be_a(String)

          expect(attributes).to have_key(:state)
          expect(attributes[:state]).to be_a(String)

          expect(attributes).to have_key(:zip)
          expect(attributes[:zip]).to be_a(String)

          expect(attributes).to have_key(:lat)
          expect(attributes[:lat]).to be_a(String)

          expect(attributes).to have_key(:lon)
          expect(attributes[:lon]).to be_a(String)
        end
      end

      it 'does not find market' do
        search_params = ({
          city: "I don't know any NC cities",
          state: 'North Carolina',
          name: 'Jim'
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response[:status])

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]

        expect(markets).to eq([])
      end
    end

    describe 'searches for just name' do
      it 'finds market' do
        market_1 = create(:market, name: "Jim's Market",
                          state: "North Carolina",
                          city: "I don't know any NC cities")
      
        search_params = ({
          name: "Market"
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response.status).to eq(200)

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]
      
        markets.each do |market|
          attributes = market[:attributes]
          expect(market).to have_key(:id)

          expect(attributes).to have_key(:name)
          expect(attributes[:name]).to be_a(String)

          expect(attributes).to have_key(:street)
          expect(attributes[:street]).to be_a(String)

          expect(attributes).to have_key(:city)
          expect(attributes[:city]).to be_a(String)

          expect(attributes).to have_key(:county)
          expect(attributes[:county]).to be_a(String)

          expect(attributes).to have_key(:state)
          expect(attributes[:state]).to be_a(String)

          expect(attributes).to have_key(:zip)
          expect(attributes[:zip]).to be_a(String)

          expect(attributes).to have_key(:lat)
          expect(attributes[:lat]).to be_a(String)

          expect(attributes).to have_key(:lon)
          expect(attributes[:lon]).to be_a(String)
        end
      end

      it 'does not find market' do
        search_params = ({
          name: "Market"
        })

        get '/api/v0/markets/search', params: search_params

        expect(response).to be_successful
        expect(response[:status])

        data = JSON.parse(response.body, symbolize_names: true)
        
        markets = data[:data]

        expect(markets).to eq([])
      end
    end
  end


  describe "sad path" do
    it 'searches for only city' do
      market_1 = create(:market, name: "Jim's Market",
        state: "North Carolina",
        city: "I don't know any NC cities")

      search_params = ({
        city: 'Canada'
      })

      get '/api/v0/markets/search', params: search_params

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      data = JSON.parse(response.body, symbolize_names: true)

      error = data[:errors].first[:detail]
        
      expect(error).to eq("Invalid set of parameters. Please provide a valid set of parameters to perform a search with this endpoint.")
    end

    it 'searches for city and name' do
      market_1 = create(:market, name: "Jim's Market",
        state: "North Carolina",
        city: "I don't know any NC cities")

      search_params = ({
        city: 'Canada',
        name: 'Jim'
      })

      get '/api/v0/markets/search', params: search_params
      
      
      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      data = JSON.parse(response.body, symbolize_names: true)

      error = data[:errors].first[:detail]
        
      expect(error).to eq("Invalid set of parameters. Please provide a valid set of parameters to perform a search with this endpoint.")
    end
  end
end