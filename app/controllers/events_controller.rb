class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
    @drivers = Driver.all
  end

  def show
  end

  def new
    @event = Event.new
    @drivers = Driver.all
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
    redirect_to schedules_path
  end

  def destroy
    @event.destroy
    redirect_to schedules_path
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :driver_id)
    end
end
