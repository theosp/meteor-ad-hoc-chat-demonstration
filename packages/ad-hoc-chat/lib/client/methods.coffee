
_.extend AdHocChat.prototype,
    fallbackToCurrentRoomId: (room_id) ->
        if not room_id? or _.isEmpty room_id
            room_id = @getCurrentRoomId()

        return room_id

    setChatRoomTitle: (options, cb) ->
        options = _.extend {}, options

        options.room_id = @fallbackToCurrentRoomId(options.room_id)
        if not options.room_id?
            cb(new Meteor.Error "room_id is a required option")

            return

        Meteor.call "setChatRoomTitle", options, cb
        
        return

    sendMessage: (message_doc, cb) ->
        message_doc = _.extend {}, message_doc

        message_doc.room_id = @fallbackToCurrentRoomId(message_doc.room_id)
        if not message_doc.room_id?
            cb(new Meteor.Error "room_id is a required option")

            return

        Meteor.call "sendMessage", message_doc, cb

        return