class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
  end

  def unsubscribed
    data = { user_id: current_user.id, status: 'Offline'}
    ActionCable.server.broadcast("appearance_channel", data)
  end

  def appear
    data = { user_id: current_user.id, status: 'Online'}
    ActionCable.server.broadcast("appearance_channel", data)
  end

  def away
    data = { user_id: current_user.id, status: 'Away'}
    ActionCable.server.broadcast("appearance_channel", data)
  end

end
