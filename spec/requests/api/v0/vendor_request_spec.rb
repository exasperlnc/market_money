require 'rails_helper'

RSpec.describe "Vendors API" do
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

  describe 'creates vendor' do
    it 'happy path' do
      vendor_params = ({
        name: 'Vendor 1',
        description: 'Not your average vendor',
        contact_name: 'John Smith',
        contact_phone: '(123)456-7890',
        credit_accepted: false
      })
    
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/vendors", headers: headers, params: JSON.generate(vendor: vendor_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      vendor = Vendor.last

      expect(vendor.name).to eq(vendor_params[:name])
      expect(vendor.description).to eq(vendor_params[:description])
      expect(vendor.contact_name).to eq(vendor_params[:contact_name])
      expect(vendor.contact_phone).to eq(vendor_params[:contact_phone])
      expect(vendor.credit_accepted).to eq(vendor_params[:credit_accepted])


      data = JSON.parse(response.body, symbolize_names: true)
      expect(data).to have_key(:data)

      vendor = data[:data]

      expect(vendor).to have_key(:id)
      expect(vendor[:id]).to be_a(String)

      expect(vendor).to have_key(:type)
      expect(vendor[:type]).to be_a(String)

      expect(vendor).to have_key(:attributes)
      expect(vendor[:attributes]).to be_a(Hash)

      attributes = vendor[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to be_a(String)

      expect(attributes).to have_key(:contact_name)
      expect(attributes[:contact_name]).to be_a(String)

      expect(attributes).to have_key(:contact_phone)
      expect(attributes[:contact_phone]).to be_a(String)

      expect(attributes).to have_key(:credit_accepted)
      expect(attributes[:credit_accepted]).to be_in([true, false])
    end

    it 'sad path' do
      vendor_params = ({
        name: 'Vendor 1',
        description: 'Not your average vendor',
        credit_accepted: false
      })

      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/vendors", headers: headers, params: JSON.generate(vendor: vendor_params)

      expect(response).to_not be_successful
    end
  end

  describe 'deletes vendor' do
    it 'happy path' do
      create(:vendor)

      vendor_params = ({
        name: 'Vendor 1',
        description: 'Not your average vendor',
        contact_name: 'John Smith',
        contact_phone: '(123)456-7890',
        credit_accepted: false
      })
    
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v0/vendors", headers: headers, params: JSON.generate(vendor: vendor_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      delete "/api/v0/vendors/#{Vendor.last.id}"

      last_vendor = Vendor.last
      expect(response).to be_successful

      expect(last_vendor.name).to_not eq(vendor_params[:name])
      expect(last_vendor.description).to_not eq(vendor_params[:description])
      expect(last_vendor.contact_name).to_not eq(vendor_params[:contact_name])
      expect(last_vendor.contact_phone).to_not eq(vendor_params[:contact_phone])
    end

    it 'sad path' do
      delete "/api/v0/vendors/1296781298"
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end