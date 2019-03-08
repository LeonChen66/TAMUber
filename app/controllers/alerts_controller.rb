class AlertsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_onduty, :only => [:edit, :update]

	def get_onduty
		@onduty = Onduty.find params[:id]
	end
	
	def onduty_params
		params.require(:onduty).permit(:isAlert)
	end

	def index
		@onduties = Onduty.all
	end

	def edit
	end

	def update
		@onduty.update_attributes!(onduty_params)
		flash[:notice] = "Onduty #{@onduty.id} was successfully updated."
		redirect_to alerts_path
	end

end
