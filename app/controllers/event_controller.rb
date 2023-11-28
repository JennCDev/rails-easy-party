class EventController < ApplicationController
  def index
    @next_events = Event.where("start_at >= ?", Date.now).order(:start_at)
    @next_events_without_date = Event.where("start_at is null")
    @previous_events = Event.where("start_at < ?", Date.now).order(start_at: :desc)# a checker les filtres pour les dates nulles
  end

  # def new
  #   @event = Event.new
  #   @event.build_address
  # end

  # def create
  #   @event = Event.new(event_params)
  #   if @event.save
  #     redirect_to event_index_path
  #   else
  #     render 'new'
  #   end
  # end

  # private
  #   def event_params
  #     params.require(:event).permit(:name, :description, :start_date, :end_date, :address_attributes => [:street, :city, :state, :zip])
  #   end
end
