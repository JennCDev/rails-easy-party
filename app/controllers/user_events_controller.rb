class UserEventsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.new
    @users = User.all
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

      # Modifier le statut en fonction du rôle de l'utilisateur dans l'événement
      if @user_event.planner
        @user_event.status = 'going' # Si c'est le planner, statut "going"
      else
        @user_event.status = 'pending' # Sinon, statut "invited"
      end

      if @user_event.save
        redirect_to event_path(@event), notice: "Utilisateur ajouté à l'événement avec succès!"
      else
        flash.now[:alert] = "Impossible d'ajouter l'utilisateur à l'événement."
        render :new, status: 422
      end
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def user_event_params
    params.require(:user_event).permit(:user_id, :planner, :status, :event_id)
  end
end
