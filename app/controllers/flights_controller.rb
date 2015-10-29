class FlightsController < ApplicationController

  def index
    if params[:date]
      date = Date.strptime(params[:date], "%m-%d-%Y")
    else
      date = Date.today
    end

    @flights = Flight.where('DATE(scheduled_at) = ?', date)
    @flights = @flights.order('scheduled_at asc').limit(100)
    # @flights = Flight.order('airlines.abbreviation asc').joins(:airline).limit(100)

    respond_to do |format|
      format.html
      format.json { render json: @flights }
    end
  end

  def destroy
    flight = Flight.find(params[:id])
    flight.destroy
    redirect_to flights_url
  end
end
