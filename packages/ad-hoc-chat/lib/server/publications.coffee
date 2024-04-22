_.extend AdHocChat.prototype,
  _setupPublications: ->
    self = @

    Meteor.publish "chat_room", (chat_room_id) ->
      check chat_room_id, String

      self.addOnlineUser chat_room_id, this.userId

      @onStop =>
        self.removeOnlineUser chat_room_id, this.userId

        return

      return [
        self.chat_rooms_collection.find(chat_room_id)
        self.chat_messages_collection.find({room_id: chat_room_id})
      ]

    return