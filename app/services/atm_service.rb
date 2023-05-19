class AtmService

  def get_atms(lat, lon)
    get_url("search/2/poiSearch/atm.json?&lat=#{lat}&lon=#{lon}")
  end

  def get_url(url)
    response= conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.tomtom.com") do |faraday|
      faraday.params["key"] = ENV["atm_api"]
    end
  end
end