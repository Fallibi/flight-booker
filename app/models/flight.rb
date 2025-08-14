class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings

  # Scope to get available dates for the search form
  def self.available_dates
    order(:start_datetime).pluck(:start_datetime).map { |d| [d.strftime("%m/%d/%Y"), d.to_date] }.uniq
  end
end
