class Api::V0::MarketVendorsController < ApplicationController
  def create
    market_vendor = MarketVendor.create(market_vendor_params)
    if market_vendor.valid?
      render json: MarketVendorSerializer.new(market_vendor)
    else
      render_failed_validation_response(market_vendor)
    end
  end

  private
    def market_vendor_params
      params.require(:market_vendor).permit(:market_id, :vendor_id)
    end
end