class UserEventsController < ApplicationController
  before_action :set_event, only: [:new, :create]

  def new
    @user_event = UserEvent.new
    @event = Event.find(params[:event_id])
    @users = User.all
  end

  def create
    @event = Event.find(params[:event_id])
    user_id = user_event_params[:user_id]
    @current_event_user = @event.user_events.find_by(user_id: user_id)

    if @current_event_user.nil?
      @user_event = UserEvent.new(user_event_params.merge(event_id: @event.id))

      if @user_event.save
        redirect_to event_path(@event), notice: "Utilisateur ajouté à l'événement avec succès!"
      else
        render :new
      end
    else
      redirect_to event_path(@event), notice: "L'utilisateur est déjà ajouté à l'événement."
    end
  end

  def search_users
    query = params[:query]
    users = User.where("first_name LIKE ?", "%#{query}%")


    render json: users
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def user_event_params
    params.require(:user_event).permit(:user_id, :planner, :status)
  end

end
