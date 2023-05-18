class Api::V0::SearchController < ApplicationController
  before_action :validate_params, only: [:index]

  def index
    @facade = SearchFacade.new(search_params)
    @markets = @facade.find_market
    render json: MarketSerializer.new(@markets)
    end
  end


  private 
    def search_params
      params.permit(:name, :city, :state)   
    end

    def only_city?
      (params[:city].present? && (!params[:state].present? && !params[:name].present?))
    end

    def only_city_name?
      ((params[:city].present? && params[:name].present?) && !params[:state].present?)
    end

    def validate_params
      if only_city? || only_city_name?
        error_message = "Invalid set of parameters. Please provide a valid set of parameters to perform a search with this endpoint."
        render json: ErrorSerializer.serialize(error_message), status: 422
    end
end