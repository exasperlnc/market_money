class SearchFacade
  def initialize(params)
    @state = params[:state]
    @name = params[:name]
    @city = params[:city]
  end

  def find_market
    Market.where("name ILIKE ? and city ILIKE ? and state ILIKE ?", "%#{@name}%", "%#{@city}%", "%#{@state}%")
  end
end