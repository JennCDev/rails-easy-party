class UserEventsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @user_event = UserEvent.new
    set_guests
  end

  def create
    user_id = user_event_params[:user_id]
    existing_user_event = @event.user_events.find_by(user_id: user_id)

    if existing_user_event
      redirect_to event_path(@event), notice: "L'utilisateur est déjà ajouté à l'événement."
    else
      @user_event = @event.user_events.new(user_event_params)
      @user_event.user_id = user_id
      @user_event.planner = user_event_params[:planner] == '1'
      @user_event.status = @user_event.planner ? 'going' : 'pending'

      if @user_event.save
        redirect_to event_path(@event), notice: "Utilisateur ajouté à l'événement avec succès!"
      else
        flash.now[:alert] = "Impossible d'ajouter l'utilisateur à l'événement."
        render :new, status: 422
      end
    end
    set_guests
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    guest = UserEvent.find(params[:id])
    # Ajouter une validation ou une logique pour s'assurer que les changements sont autorisés
    guest.update(planner: !guest.planner)
    redirect_to new_event_user_event_path(guest.event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_guests
    @guests = @event.user_events.includes(:user).where(status: ['going', 'pending'])
  end

  def user_event_params
    params.require(:user_event).permit(:user_id, :planner, :status, :event_id)
  end
end
