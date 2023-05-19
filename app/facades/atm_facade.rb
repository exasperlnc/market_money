class AtmFacade

  def initialize(lat, lon)
    @lat = lat
    @lon = lon
  end

  def atms
    service = AtmService.new

    json = service.get_atms(@lat, @lon)

    @atms = json[:results].map do |result|
      Atm.new(result)
    end
  end
end