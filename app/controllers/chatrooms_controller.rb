class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @event = Event.find(params[:event_id])
    @chatroom = @event.chatroom
    @message = Message.new

  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
