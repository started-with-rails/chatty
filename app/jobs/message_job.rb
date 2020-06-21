class MessageJob < ApplicationJob
  include CableReady::Broadcaster
  queue_as :default

  def perform(message)
    html = ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
    cable_ready["room_channel_#{message.room_id}"].insert_adjacent_html(
      selector: "#chat-messages",
      position: "beforeend",
      html: html
    )
    cable_ready.broadcast
  end
end
