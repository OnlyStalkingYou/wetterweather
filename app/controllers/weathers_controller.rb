class WeathersController < ApplicationController
	def index
	end

	def show       
		@weathers = Weather.find(params[:id])
		@wetterweather = @weathers.get_weather
		@current_weather = @wetterweather.currently
		@icon = @current_weather.icon
		@daily_weather = @wetterweather.daily.data[1, 5]
	end

	def create
		@weathers = Weather.create(weather_params)
		if @weathers.save
		  redirect_to weather_path(@weathers)
		else
		  render 'index', alert: "Please enter valid address"
		end
	end

	private

	def weather_params
		params.require(:weather).permit(:address)
	end
end
