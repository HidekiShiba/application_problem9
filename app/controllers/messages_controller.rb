class MessagesController < ApplicationController
  def create
    @message = Message.create((message_params).merge(user_id: current_user.id))
    @room = Room.find(params[:message][:room_id])
    @messages = @room.messages
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :content, :room_id)
  end
end
