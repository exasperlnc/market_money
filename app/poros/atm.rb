class Atm
  attr_reader :name,
              :address,
              :lat,
              :lon,
              :distance,
              :id

  def initialize(atm_data)
    @name = atm_data[:poi][:name]
    @address = atm_data[:address][:freeformAddress]
    @lat = atm_data[:position][:lat]
    @lon = atm_data[:position][:lon]
    @distance = atm_data[:dist]
    @id = nil
  end
end