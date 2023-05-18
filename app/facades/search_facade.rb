class SearchFacade
  def find_market(name, state, city)
    Market.where("name ILIKE ? and city ILIKE ? and state ILIKE?", "%#{name}%", "%#{state}%", "%#{city}%")
  end
end