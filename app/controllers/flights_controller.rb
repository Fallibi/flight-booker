class FlightsController < ApplicationController
  def index
    # Options for the search form dropdowns
    @airports = Airport.all.map { |a| [a.code, a.id] }
    @passenger_options = (1..4).map { |n| [n, n] }
    @available_dates = Flight.available_dates

    # Search logic
    if params[:date]
      @available_flights = Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id]
      ).where(start_datetime: Date.parse(params[:date]).all_day)
    end
  end
end