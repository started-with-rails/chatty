class MessageJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(message)
    html = ApplicationController.render(
      partial: 'messages/send',
      locals: { message: message }
    )
    cable_ready["room_channel_#{message.room_id}"].insert_adjacent_html(
      user_id: message.user_id,
      selector: "#chat-messages",
      position: "beforeend",
      html: html
    )
    cable_ready.broadcast
  end
end
