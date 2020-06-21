module RoomsHelper
    def get_class(message)
        message.user == current_user ?  'replies' : 'sent'
    end
end
