class PassengerMailer < ApplicationMailer
  default from: 'notifications@flightbooker.com'

  def confirmation_email(passenger)
    @passenger = passenger
    @booking = @passenger.booking
    @flight = @booking.flight
    
    mail(to: @passenger.email, subject: 'Your Flight Booking is Confirmed!')
  end
end
