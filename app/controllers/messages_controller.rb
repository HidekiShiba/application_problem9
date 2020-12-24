class MessagesController < ApplicationController
  def create
      @message = Message.create((message_params).merge(user_id: current_user.id))
      redirect_to request.referer
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :content, :room_id)
  end
end
