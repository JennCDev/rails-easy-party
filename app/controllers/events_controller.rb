class EventsController < ApplicationController
  def index
    @next_events = Event.where("start_at >= ?", Date.today).order(:start_at)
    @next_events_without_date = Event.where("start_at is null")
    @previous_events = Event.where("start_at < ?", Date.today).order(start_at: :desc)

    if params[:type] == "next"
      @next_events_without_date = Event.where("start_at is null")
      @next_events = Event.where("start_at >= ?", Date.today).order(:start_at)
    elsif params[:type] == "previous"
      @previous_events = Event.where("start_at < ?", Date.today).order(start_at: :desc)
    else
      @next_events_without_date = Event.where("start_at is null")
      @next_events = Event.where("start_at >= ?", Date.today).order(:start_at)
      @previous_events = Event.where("start_at < ?", Date.today).order(start_at: :desc)
    end

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

  def show
    @event = Event.find(params[:id])
  end



  private

  def event_params
    params.require(:event).permit(:title, :description, :start_at, :end_at, :place)
  end
end
