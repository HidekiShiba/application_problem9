class RoomsController < ApplicationController
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create((entry_params).merge(room_id: @room.id))
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
    @another_entry = @room.entries.find_by('user_id != ?', current_user.id)
  end

  private
  def entry_params
    params.require(:entry).permit(:user_id, :room_id)
  end
end
