_.extend AdHocChat.prototype,
  _setupPublications: ->
    self = @

    Meteor.publish "chat_room", (chat_room_id) ->
      check chat_room_id, String

      self.addOnlineUser @, chat_room_id

      @onStop =>
        self.removeOnlineUser @, chat_room_id

        return

      return [
        self.chat_rooms_collection.find(chat_room_id)
        self.chat_messages_collection.find({room_id: chat_room_id})
      ]

    Meteor.publish "public_basic_user_info", (users) ->
      check users, [String]

      return Meteor.users.find({_id: {$in: users}}, {fields: {"_id": 1, "profile.nickname": 1}})
    
    return
