class ChatroomsController < ApplicationController
  def index
    @chatrooms =  current_user.events.map do |event|
      last_message = event.chatroom.messages.order(created_at: :desc).first
      unread_messages_count = event.chatroom.messages.where(read: false).count
      { chatroom: event.chatroom, last_message: last_message, unread_messages_count: unread_messages_count }
    end
  end

  def show
    @event = Event.find(params[:event_id])
    @chatroom = @event.chatroom
    @message = Message.new
    @chatroom.messages.where(user: current_user, read: false).update_all(read: true)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
