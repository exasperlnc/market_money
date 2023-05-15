class Api::V0::MarketsController < ApplicationController
  def index
    render json: MarketSerializer.format_markets(Market.all)
  end

  def show
    market = Market.find(params[:id])
    render json:MarketSerializer.format_one_market(market)
  end
end