_.extend AdHocChat.prototype,
    setChatRoomTitle: (options, cb) ->
        if not options.room_id
            if (current_room_id = @getCurrentRoomId())?
                options = _.extend {}, options,
                    room_id: current_room_id
            else
                cb(new Meteor.Error "roomId is a required option")

                return

        Meteor.call "setChatRoomTitle", options, cb
        
        return