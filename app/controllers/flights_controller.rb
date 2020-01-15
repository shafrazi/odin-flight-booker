class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @airport_options = @airports.map { |airport| [airport.name, airport.id] }

    if params[:from_airport] && params[:to_airport]
      @from_airport = Airport.find(params[:from_airport])
      @to_airport = Airport.find(params[:to_airport])
      @search_results = Flight.where("from_airport_id = ? AND to_airport_id = ?", params[:from_airport], params[:to_airport])
    else
      @search_results = []
    end
  end
end
