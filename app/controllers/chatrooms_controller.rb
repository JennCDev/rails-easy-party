class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all.map do |chatroom|
      last_message = chatroom.messages.order(created_at: :desc).first
      unread_messages_count = chatroom.messages.where(read: false).count
      { chatroom: chatroom, last_message: last_message, unread_messages_count: unread_messages_count }
    end     #A modif
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
