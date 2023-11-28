class EventsController < ApplicationController
  def index
    @next_events = Event.where("start_at >= ?", Date.today).order(:start_at)
    @next_events_without_date = Event.where("start_at is null")
    @previous_events = Event.where("start_at < ?", Date.today).order(start_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date, :place)
  end
end
