_.extend AdHocChat.prototype,
  _setupMethods: ->
    self = @

    Meteor.methods
      setChatRoomTitle: (options) ->
        self.setChatRoomTitle options, @userId

        return

    return