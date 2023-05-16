class Api::V0::MarketsController < ApplicationController
  def index
    render json: MarketSerializer.new(Market.all)
  end

  def show
    market = Market.find(params[:id])
    if market
      render json:MarketSerializer.new(market)
    else
      ErrorMember.new("Couldn't find Market with 'id'=#{params[:id]}", "NOT FOUND", 404)
    end
  end
end