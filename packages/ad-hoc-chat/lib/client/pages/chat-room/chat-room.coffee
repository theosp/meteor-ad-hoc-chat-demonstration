Template.chat_room.onCreated ->
    @updateTitle = (e) ->
        title = $(e.target).text().trim()

        if title == APP.ad_hoc_chat.getCurrentRoom().title
            return

        e.target.innerHTML = "" # A workaround for an issue with blaze and contenteditable
                                # https://github.com/meteor/meteor/issues/1964

        APP.ad_hoc_chat.setChatRoomTitle {title}

        return

    return

Template.chat_room.helpers
    roomTitle: ->
        room = APP.ad_hoc_chat.getCurrentRoom()
        return room.title

Template.chat_room.events
    "focusout .room-title": (e, tpl) ->
        tpl.updateTitle e

        return

    "keyup .room-title": (e, tpl) ->
        # Check if enter was pressed
        if e.which isnt Helpers.enter_key_code
            return

        tpl.updateTitle e

        return
    