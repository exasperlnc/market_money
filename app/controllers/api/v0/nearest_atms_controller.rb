class Api::V0::NearestAtmsController < ApplicationController

  def index
    #define what will be passed into the query
    render json: AtmSerializer.new(query)
  end
end