class PassengerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/passenger_mailer/confirmation_email
  def confirmation_email
    # Make sure you have at least one passenger in your database
    passenger = Passenger.first 
    PassengerMailer.confirmation_email(passenger)
  end

end
