class RoomsController < ApplicationController
  before_action :set_room, only: [:destroy, :show]

  def index
    @rooms = Room.all
  end

  def show
   @rooms = Room.all 
   @messages = @room.messages
   render :index
  end

  def create
    @room = current_user.rooms.build(room_params)
    @room.save
    redirect_to root_path
  end

  def destroy
    @room.destroy
    redirect_to root_path
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.includes(messages: :user).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def room_params
    params.require(:room).permit(:name)
  end
end
