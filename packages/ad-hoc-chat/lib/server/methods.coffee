_.extend AdHocChat.prototype,
  _setupMethods: ->
    self = @

    Meteor.methods
      setChatRoomTitle: (options) ->
        self.setChatRoomTitle options, @userId

        return

      sendMessage: (message_doc) ->
        self.sendMessage message_doc, @userId

        return

    return