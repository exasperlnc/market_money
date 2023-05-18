class Atm
  attr_reader :name,
              :street_number,
              :street_name,
              :city,
              :state,
              :zip,
              :lat,
              :lon,
              :distance
              
  def initialize(atm_data)
    @name = atm_data[:poi][:name]
    @street_number = atm_data[:address][:streetNumber]
    @street_name = atm_data[:address][:streetname]
    @city = atm_data[:address][:municipality]
    @state = atm_data[:address][:countrySubdivision]
    @zip = atm_data[:address][:postalCode]
    @lat = atm_data[:position][:lat]
    @lon = atm_data[:position][:lon]
    @distance = atm_data[:dist]
  end
end