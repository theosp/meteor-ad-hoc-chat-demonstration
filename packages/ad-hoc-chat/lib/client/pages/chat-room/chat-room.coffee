Template.chat_room.onCreated ->
    @updateTitle = (e) ->
        title = $(e.target).text().trim()

        if title == APP.ad_hoc_chat.getCurrentRoom().title
            return

        e.target.innerHTML = "" # A workaround for an issue with blaze and contenteditable
                                # https://github.com/meteor/meteor/issues/1964

        APP.ad_hoc_chat.setChatRoomTitle {title}, (err) ->
            if not err?
                return

            Helpers.toastError
                title: "Error"
                content: err.reason

            return

        return

    ongoing_attempt = false
    @attemptSend = ->
        if ongoing_attempt
            return

        message = $(".message-input").val().trim()

        if message.length is 0
            return

        ongoing_attempt = true
        APP.ad_hoc_chat.sendMessage {message}, (err) ->
            ongoing_attempt = false
            if not err?
                $(".message-input").val("")
                return

            Helpers.toastError
                title: "Error"
                content: err.reason

            return

        return

    @scrollToBottom = ->
        messages_el = $(".messages").get(0)
        if messages_el?
            messages_el.scrollTop = messages_el.scrollHeight

        return

    @autorun =>
        # Track new messages, to scroll to the bottom the viewport once a new message is added
        room_id = APP.ad_hoc_chat.getCurrentRoomId()

        APP.ad_hoc_chat.getRoomMessagesCursor(room_id).fetch()

        # Wait for blaze to actually render the new message before scrolling to the bottom
        setTimeout =>
            @scrollToBottom()
        , 0

        return

    return

Template.chat_room.onRendered ->
    @scrollToBottom()

    # Focus on the message input
    $(".message-input").focus()

    return

Template.chat_room.helpers
    roomTitle: ->
        room = APP.ad_hoc_chat.getCurrentRoom()
        return room.title

    onlineParticipants: ->
        room = APP.ad_hoc_chat.getCurrentRoom()

        online_users = APP.ad_hoc_chat.getOnlineUsersInRoomDoc(room)

        return Meteor.users.find({_id: {$in: online_users}}).fetch()

    messages: ->
        room_id = APP.ad_hoc_chat.getCurrentRoomId()

        return APP.ad_hoc_chat.getRoomMessagesCursor(room_id).fetch()

    isMyMessage: ->
        return this.user_id == Meteor.userId()

    currentUrl: ->
        return Router.current().location.get().href

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

    "keyup .message-input": (e, tpl) ->
        # Check if enter was pressed
        if e.which isnt Helpers.enter_key_code
            return

        tpl.attemptSend()

        return
    
    "click .send": (e, tpl) ->
        tpl.attemptSend()

        return

Template.message_stamp.helpers
    nickname: ->
        user = Meteor.users.findOne(@user_id)
        return user?.profile?.nickname

    hour: ->
        @timestamp.toLocaleTimeString([], {hour: "2-digit", minute: "2-digit"})

    day: ->
        # Month's 3 letters
        wihtout_year = @timestamp.toLocaleDateString([], {month: "short", day: "2-digit"})

        # If not same year, add year
        if @timestamp.getFullYear() isnt new Date().getFullYear()
            return "#{wihtout_year}, #{@timestamp.getFullYear()}"

        return wihtout_year