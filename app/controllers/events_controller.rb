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

  def show
    @event = Event.find(params[:id])
  end



  private

  def event_params
<<<<<<< HEAD
    params.require(:event).permit(:title, :description, :start_at, :end_at, :place)
=======
    params.require(:event).permit(:title, :description, :start_date, :end_date, :place, photos: [])
>>>>>>> 03a184869831f7a5a815cdd3fa0e3fbf58084492
  end
end
