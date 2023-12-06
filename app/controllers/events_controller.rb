class EventsController < ApplicationController
  def index
    # @next_events = Event.where("start_at >= ?", Date.today).order(:start_at)
    # @next_events_without_date = Event.where("start_at is null")
    # @previous_events = Event.where("start_at < ?", Date.today).order(start_at: :desc)

    @next_events = Event.joins(:user_events)
                        .where("start_at >= ? AND user_events.user_id = ?", Date.today, current_user.id)
                        .order(:start_at)
                        .distinct
    @next_events_without_date = Event.joins(:user_events)
                                     .where("start_at is null AND user_events.user_id = ?",  current_user.id)
                                     .distinct
    @previous_events = Event.joins(:user_events)
                            .where("start_at < ? AND user_events.user_id = ?", Date.today, current_user.id)
                            .order(start_at: :desc)
                            .distinct
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      user_event = UserEvent.new(user: current_user, event: @event, planner: true, status: 'going')
      user_event.save

      unless @event.start_at && @event.end_at
        @survey_date = Survey.new
        @survey_date.question = "Vos dispos?"
        @survey_date.category = "Date"
        @survey_date.user = current_user
        @survey_date.event = @event
        @survey_date.deadline = Date.today + 1.week
        @survey_date.save
      end
      unless @event.place != ""
        @survey_place = Survey.new
        @survey_place.question = "Où va-t-on?"
        @survey_place.category = "Lieu"
        @survey_place.user = current_user
        @survey_place.event = @event
        @survey_place.deadline = Date.today + 1.week
        @survey_place.save
      end
      user_event = UserEvent.new
      user_event.user = current_user
      user_event.event = @event
      user_event.planner = true
      user_event.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @user_events = UserEvent.where(event_id: @event.id)
    @user_event = @event.user_events.find_by(user_id: current_user.id)
    @user_is_planner = @user_event.planner if @user_event
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end


  def set_interested
    update_status('maybe')
  end

  def set_going
    update_status('going')
  end

  def set_not_going
    update_status("can't go")
  end

  def invite
    if user_signed_in?
      @event = Event.find(params[:id])
      unless UserEvent.find_by(event: @event, user: current_user)
        @user_event = UserEvent.new
        @user_event.event = @event
        @user_event.user = current_user
        @user_event.status = "pending"
        @user_event.planner = false
        @user_event.save
      end
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_at, :end_at, :place, :photo_banner, new_photos: [])
  end

  def update_status(new_status)
    user_event = UserEvent.find_by(event_id: params[:id], user_id: current_user.id)
    if user_event
      user_event.update(status: new_status)
      redirect_to event_path(params[:id]), notice: "Statut mis à jour avec succès!"
    else
      redirect_to event_path(params[:id]), alert: "Erreur lors de la mise à jour du statut."
    end
  end
end
