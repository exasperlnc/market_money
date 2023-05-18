class Api::V0::SearchController < ApplicationController
  before_action :validate_params, only: [:index]

  def index
    @facade = SearchFacade.new(search_params)
    if !validate_params
      render json: MarketSerializer.new(@facade.find_market)
    else
      ErrorMember.new("Invalid Search: search must not only be city, or be only city and state.", "INVALID PARAMS", 422)
    end
  end


  private 
    def search_params
      params.permit(:name, :city, :state)   
    end

    def only_city?
      (params[:city].present? && !(params[:state].present? || params[:name].present?))
    end

    def only_city_name?
      ((params[:city].present? && params[:name].present?) && !params[:state].present?)
    end

    def validate_params
      false if only_city? || only_city_name?
    end
end