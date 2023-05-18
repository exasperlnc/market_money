require 'rails_helper'

RSpec.describe AtmService do
  context 'class methods' do
    describe '#get_atms' do
      it 'returns atm data' do
        provo_coordinates = {
          lat: 40.2338,
          lon: -111.658531
        }
        search = AtmService.new.get_atms(provo_coordinates[:lat], provo_coordinates[:lon])
        search_results = search[:results]

        search_results.each do |result|
          info = result[:poi]
          expect(info).to have_key(:name)
  
          expect(result).to have_key(:address)
          address = result[:address]
          expect(address).to have_key(:streetNumber)
          expect(address).to have_key(:streetName)
          expect(address).to have_key(:municipality)
          expect(address).to have_key(:countrySubdivision)
          expect(address).to have_key(:postalCode)

          expect(result).to have_key(:position)
          position = result[:position]
          expect(position).to have_key(:lat)
          expect(position).to have_key(:lon)
        end
      end
    end
  end
end