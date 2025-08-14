# Clear existing data
puts "Destroying existing records..."
Passenger.destroy_all
Booking.destroy_all
Flight.destroy_all
Airport.destroy_all

# Create Airports
puts "Creating airports..."
airports = [
  { code: 'SFO' }, # San Francisco
  { code: 'NYC' }, # New York City (using a generic code for simplicity)
  { code: 'LAX' }, # Los Angeles
  { code: 'CHI' }  # Chicago
]
airports.each do |airport|
  Airport.create!(airport)
end
puts "Airports created."

# Get airport objects
sfo = Airport.find_by(code: 'SFO')
nyc = Airport.find_by(code: 'NYC')
lax = Airport.find_by(code: 'LAX')
chi = Airport.find_by(code: 'CHI')

# Create Flights
puts "Creating flights..."
flight_count = 0
(1..14).each do |day|
  # SFO -> LAX (multiple flights per day)
  Flight.create!(departure_airport: sfo, arrival_airport: lax, start_datetime: day.days.from_now.beginning_of_day + 8.hours, duration_in_minutes: 75)
  Flight.create!(departure_airport: sfo, arrival_airport: lax, start_datetime: day.days.from_now.beginning_of_day + 14.hours, duration_in_minutes: 75)
  flight_count += 2

  # NYC -> CHI
  Flight.create!(departure_airport: nyc, arrival_airport: chi, start_datetime: day.days.from_now.beginning_of_day + 10.hours, duration_in_minutes: 150)
  flight_count += 1

  # LAX -> NYC
  Flight.create!(departure_airport: lax, arrival_airport: nyc, start_datetime: day.days.from_now.beginning_of_day + 11.hours, duration_in_minutes: 300)
  flight_count += 1
end
puts "Created #{flight_count} flights."

puts "Database seeded successfully! 🌱"

