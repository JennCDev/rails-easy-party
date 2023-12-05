class UserEventsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.new
    @users = User.all
    @guests = @event.user_events.includes(:user).where(status: 'pending')
  end

  def create
    user_id = user_event_params[:user_id]
    existing_user_event = @event.user_events.find_by(user_id: user_id)

    if existing_user_event
      # Redirection si l'utilisateur est déjà inscrit à l'événement
      redirect_to event_path(@event), notice: "L'utilisateur est déjà ajouté à l'événement."
    else
      @user_event = @event.user_events.new(user_event_params)
      @user_event.user_id = user_id
      @user_event.planner = user_event_params[:planner] == '1'
      @user_event.status = @user_event.planner ? 'going' : 'pending'

      if @user_event.save
        # Redirection en cas de succès
        redirect_to event_path(@event), notice: "Utilisateur ajouté à l'événement avec succès!"
      else
        # Préparation de la vue 'new' en cas d'erreur
        flash.now[:alert] = "Impossible d'ajouter l'utilisateur à l'événement."
        @guest = @event.user_events.includes(:user).where(status: 'pending')
        render :new, status: 422
      end
    end
  end


    def show
      @event = Event.find(params[:id])
    end

    def update
      guest = UserEvent.find(params[:id])
      guest.update(planner: guest.planner == false)
      redirect_to new_event_user_event_path(guest.event)
    end



  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def user_event_params
    params.require(:user_event).permit(:user_id, :planner, :status, :event_id)
  end
end
