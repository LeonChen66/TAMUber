class OndutiesController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	before_action :get_onduty, :only => [:show, :edit, :update, :destroy]

	def get_onduty
		@onduty = Onduty.find params[:id]
	end

	def onduty_params
		params.require(:onduty).permit(:driverName,:plateNumber,:studentName,:studentId,:vehicleLat,:vehicleLng,:startLat,:startLng,:endLat,:endLng)
	end

	def index
		@onduties = Onduty.where(:isFinished => false)
	end

	def new
	end

	def show
	end

	def create
		@onduty = Onduty.create!(onduty_params)
		flash[:notice] = "Onduty #{@onduty.id} was successfully created."
		redirect_to onduties_path
	end

	def edit
	end

	def update
		@onduty.update_attributes!(onduty_params)
		flash[:notice] = "Onduty #{@onduty.id} was successfully updated."
		redirect_to onduties_path
	end

	def destroy
		@onduty.destroy
		flash[:notice] = "Onduty #{@onduty.id} was successfully deleted."
		redirect_to onduties_path
	end

	def update_car_pos
		onduty = Onduty.find_by_id(params[:id_])
		if params[:isFinished] == 'true'
			att = {:isFinished => true}
			#set driver available
			@driver = Driver.where(name: params[:driverName]).first
			if @driver
				@driver.isAvailable = true
				@driver.save
			end
			@vehicle = Vehicle.where(name: params[:plateNumber]).first
			if @vehicle
				@vehicle.isAvailable = true
				@vehicle.save
			end
		else
			att = {:vehicleLng => params[:lng], :vehicleLat => params[:lat]}
		end
		onduty.update_attributes!(att)
	end
end
