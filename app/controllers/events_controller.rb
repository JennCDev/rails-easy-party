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
      unless @event.start_at && @event.end_at
        @survey_date = Survey.new
        @survey_date.question = "Quelles sont vos disponibilités?"
        @survey_date.category = "date"
        @survey_date.user = current_user
        @survey_date.event = @event
        @survey_date.deadline = Date.today + 1.week
        @survey_date.save
      end
      unless @event.place
        @survey_place = Survey.new
        @survey_place.question = "Où voulez-vous aller?"
        @survey_place.category = "place"
        @survey_place.user = current_user
        @survey_place.event = @event
        @survey_place.deadline = Date.today + 1.week
        @survey_place.save
      end
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @user_events = UserEvent.where(event_id: @event.id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_at, :end_at, :place, photos: [])
  end
end
