class MessageChannel < ApplicationCable::Channel
  def subscribed
     stream_from "room_channel_#{params[:id]}"
    #  stream_from "message-stream"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
