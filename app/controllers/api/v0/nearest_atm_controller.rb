class Api::V0::NearestAtmController < ApplicationController
  before_action :find_market, only: [:index]
  
  def index
    facade = AtmFacade.new(@market.lat, @market.lon)
    atms = facade.atms
    render json: AtmSerializer.new(atms)
  end

  private
    def find_market
      @market = Market.find(params[:market_id])
    end
end