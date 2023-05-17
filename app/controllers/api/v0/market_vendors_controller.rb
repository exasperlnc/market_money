class Api::V0::MarketVendorsController < ApplicationController
  before_action :find_market_vendor, only: [:destroy]

  def create
    market_vendor = MarketVendor.create(market_vendor_params)
    if market_vendor.valid?
      render json: MarketVendorSerializer.new(market_vendor)
    else
      render_failed_validation_response(market_vendor)
    end
  end

  def destroy
    render json: @market_vendor.destroy, status: 204
  end

  private
    def find_market_vendor
      @market_vendor = MarketVendor.find(params[:id])
    end

    def market_vendor_params
      params.require(:market_vendor).permit(:market_id, :vendor_id)
    end
end