import "meteor/aldeed:collection2/static"

_.extend AdHocChat.prototype,
  _attachCollectionsSchemas: ->
    @_attachUsersCollectionSchema()
    @_attachChatRoomsCollectionSchema()
    @_attachChatMessagesCollectionSchema()

    return

  _attachUsersCollectionSchema: ->
    schema =
      "createdAt":
        type: Date
      
      "services":
        type: Object
        blackbox: true # We leave this one as a blackbox because it is a
                       # Meteor internal field and we don't need to validate it
      
      "username": # Username is set to a random id, we don't really use it
                  # but it is required by Meteor
        type: String
      
      "profile":
        type: Object
      "profile.nickname":
        type: String
        optional: true
        max: AdHocChat.max_nickname_length
    
    Meteor.users.attachSchema schema

    return

  _attachChatRoomsCollectionSchema: ->
    schema =
      title: # The title of the chat room
             # An undefined title means that the chat room was never setupped by the user
             # since the UI won't allow the user to create a chat room without a title
             # and after the chat room is created the title can't be set to undefined
        type: String
        optional: true
        max: AdHocChat.max_room_title_length

      online_users:
        optional: true
        type: Array

      "online_users.$":
        optional: true
        type: String

    @chat_rooms_collection.attachSchema schema

    return

  _attachChatMessagesCollectionSchema: ->
    schema =
      room_id:
        type: String

      user_id:
        type: String

      message:
        type: String
        max: AdHocChat.max_message_length

      timestamp:
        type: Date

        autoValue: ->
          if this.isInsert
            return new Date()
          else if this.isUpsert
            return { $setOnInsert: new Date() }
          else
            this.unset()

    @chat_messages_collection.attachSchema schema

    return