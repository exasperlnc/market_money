class Api::V0::VendorsController < ApplicationController
  before_action :find_vendor, only: [:show, :update, :destroy]
  def index
    market = Market.find(params[:market_id])
    vendors = market.vendors
    render json: VendorSerializer.new(vendors)
  end

  def show
    render json: VendorSerializer.new(@vendor)
  end

  def create
    vendor = Vendor.create(vendor_params)
    if vendor.valid?
      render json: VendorSerializer.new(vendor), status: 201
    else
      render_failed_validation_response(vendor)
    end
  end

  def destroy
    render json: @vendor.destroy, status: 204
  end

  def update
    @vendor.update!(vendor_params)
    render json: VendorSerializer.new(@vendor) 
  end

  private

    def find_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:name, :description, :contact_name, :contact_phone, :credit_accepted)
    end
end