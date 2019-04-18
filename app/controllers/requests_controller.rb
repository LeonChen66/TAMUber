class RequestsController < ApplicationController
	# before_action :authenticate_user!
	before_action :get_request, :only => [:show, :edit, :update, :destroy]

	def get_request
		@request = Request.find params[:id]
	end

	def request_params
		params.require(:request).permit(:name,:studentId,:startLat,:startLng,:endLat,:endLng)
	end



	def index
		@requests = Request.all
	end

	def new
	end

	def show
	end

	def create
		@driver = Driver.where(isAvailable: true).first
		@vehicle = Vehicle.where(isAvailable: true).first
		if(@driver==nil || @vehicle==nil)
			flash[:notice] = "No available drivers or vehicles."
			redirect_to requests_path
		else
			#need to set vehicle start point
			@request = Request.create!(request_params)
			onduty_dic={}
			onduty_dic["driverName"] = @driver.name
			onduty_dic["plateNumber"] = @vehicle.name
			onduty_dic["studentName"] = @request.name
			onduty_dic["studentId"] = @request.studentId
			onduty_dic["vehicleLat"] = @request.startLat
			onduty_dic["vehicleLng"] = @request.startLng
			onduty_dic["startLat"] = @request.startLat
			onduty_dic["startLng"] = @request.startLng
			onduty_dic["endLat"] = @request.endLat
			onduty_dic["endLng"] = @request.endLng
			onduty_dic["isFinished"] = false
			onduty_dic["isAlert"] = false

			@request_to_onduty = Onduty.create!(onduty_dic)

			@driver.isAvailable = false
			@vehicle.isAvailable = false
			@driver.save
			@vehicle.save

			flash[:notice] = "Request #{@request.name} was successfully created."
			redirect_to requests_path
		end
	end

	def edit
	end

	def update
		@request.update_attributes!(request_params)
		flash[:notice] = "Request #{@request.name} was successfully updated."
		redirect_to requests_path
	end

	def destroy
		@request.destroy
		flash[:notice] = "Request #{@request.name} was successfully deleted."
		redirect_to requests_path
	end
end
