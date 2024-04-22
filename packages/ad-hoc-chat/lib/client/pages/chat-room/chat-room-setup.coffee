room_title_input_selector = ".room-title"

Template.chat_room_setup.onCreated ->
    Helpers.addErrorsFacilityToTemplateInstance(@)

    @setChatRoomTitle = ->
        @clearErrors()

        title = @$(room_title_input_selector).val()

        title = title.trim()

        if _.isEmpty(title)
            return
        
        if title.length > AdHocChat.max_room_title_length
            @addError("Please enter a title that is less than #{AdHocChat.max_room_title_length} characters")
            return

        APP.ad_hoc_chat.setChatRoomTitle {room_id: APP.ad_hoc_chat.getCurrentRoomId(), title: title}, (err, res) =>
            if err?
                @addError(err)
                return

            return

        return

    return

Template.chat_room_setup.onRendered ->
    # focus on the room title input
    @$(room_title_input_selector).focus()

    return

Template.chat_room_setup.helpers
    errors: -> Template.instance().getErrors()

    hasErrors: -> Template.instance().hasErrors()

Template.chat_room_setup.events
    "keyup #{room_title_input_selector}": (e, tpl) ->
        tpl.clearErrors()

        # Check if enter was pressed
        if e.which isnt Helpers.enter_key_code
            return

        tpl.setChatRoomTitle()

        return
    
    "click .join": (e, tpl) ->
        tpl.setChatRoomTitle()

        return