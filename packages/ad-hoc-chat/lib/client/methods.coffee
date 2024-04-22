_.extend AdHocChat.prototype,
    setChatRoomTitle: (options, cb) ->
        Meteor.call "setChatRoomTitle", options, cb
        
        return