Template.chat_room_logged_in.helpers
    isRoomLoaded: ->
        # A room will exist even before the user set its title for the first time
        # since when we subscribe to a room's publication we log the user as online
        #
        # Hence, if we can't find the current room, it means the subscription isn't ready
        return APP.ad_hoc_chat.getCurrentRoom()?

    isKnownRoom: ->
        current_room = APP.ad_hoc_chat.getCurrentRoom()

        # If the chat room and its title are defined, we regard the room as known
        return not _.isEmpty(current_room) and current_room.title?