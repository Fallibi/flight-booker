class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new
    # Build passenger fields based on the number of tickets selected
    params[:num_tickets].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      # In a real app, you would send a confirmation email here
      flash[:success] = "Flight booked successfully! ✅"
      redirect_to booking_path(@booking)
    else
      # If saving fails, we need to re-fetch the flight for the form
      @flight = Flight.find(booking_params[:flight_id])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end