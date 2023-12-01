class UserEventsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.new
    @users = User.all
  end

  def create
    user_id = user_event_params[:user_id]
    if @event.user_events.exists?(user_id: user_id)
      redirect_to event_path(@event), notice: "L'utilisateur est déjà ajouté à l'événement."
    else
      @user_event = @event.user_events.new(user_event_params)
      @user_event.user_id = user_id
      @user_event.planner = user_event_params[:planner].present?
      @user_event.status = @user_event.planner ? 'going' : 'pending'

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
    params.require(:user_event).permit(:user_id, :planner, :status)
  end
end
