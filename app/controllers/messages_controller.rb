# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      #
    end
  end

  def mark_messages_as_read(chatroom, user)
    chatroom.messages.where(user: user, read: false).update_all(read: true)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
