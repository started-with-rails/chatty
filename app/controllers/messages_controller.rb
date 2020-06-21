class MessagesController < ApplicationController
    def create
        @message = current_user.messages.build(message_params)
        @message.save
        MessageJob.perform_later(@message)
        # redirect_to room_path(@message.room)
    end

    private
 

    # Only allow a trusted parameter "white list" through.
    def message_params
        params.require(:message).permit(:content, :room_id)
    end

end
