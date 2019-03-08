class DriversController < ApplicationController
	before_action :authenticate_user!
	before_action :get_driver, :only => [:show, :edit, :update, :destroy]

	def get_driver
		@driver = Driver.find params[:id]
	end

	def driver_params
		params.require(:driver).permit(:name,:isAvailable,:Email,:UIN)
	end

	def index
		@drivers = Driver.all
	end

	def new
	end

	def show
		id = params[:id] # retrieve movie ID from URI route
    	@driver = Driver.find(id) # look up driver by unique ID
	end

	def create
		@driver = Driver.create!(driver_params)
		flash[:notice] = "Driver #{@driver.name} was successfully created."
		redirect_to drivers_path
	end

	def edit
		@driver = Driver.find params[:id]
	end

	def update
		@driver.update_attributes!(driver_params)
		flash[:notice] = "Driver #{@driver.name} was successfully updated."
		redirect_to drivers_path
	end

	def destroy
		@driver.destroy
		flash[:notice] = "Driver #{@driver.name} was successfully deleted."
		redirect_to drivers_path
	end
end
