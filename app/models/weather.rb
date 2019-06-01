class Weather < ApplicationRecord
	geocoded_by :address
	after_validation :geocode, :if => :address.present? && :address_changed?

	def get_weather
		ForecastIO.forecast(latitude, longitude)
	end
end
