_.extend AdHocChat.prototype,
  _immediateInit: ->
    return

  _deferredInit: ->
    if @destroyed
      return

    # Defined in methods.coffee
    @_setupMethods()

    # Defined in publications.coffee
    @_setupPublications()

    # Defined in collections-hooks.coffee
    @_setupCollectionsHooks()

    # Defined in collections-indexes.coffee
    @_ensureIndexesExists()

    return

  setChatRoomTitle: (options, user_id) ->
    check options,
      room_id: String
      title: String

    check user_id, String

    if options.title.length > AdHocChat.max_room_title_length
      throw new Meteor.Error "invalid-title", "Title must be at most #{AdHocChat.max_room_title_length} characters long"

    @chat_rooms_collection.update options.room_id,
      $set:
        title: options.title

    return

  sendMessage: (message, user_id) ->
    check message,
      room_id: String
      text: String

    check user_id, String

    @chat_messages_collection.insert
      room_id: message.room_id
      text: message.text
      user_id: user_id
      created_at: new Date

    return

  addOnlineUser: (room_id, user_id) ->
    check room_id, String
    check user_id, String

    @chat_rooms_collection.upsert room_id,
      $addToSet:
        online_users: user_id

    return

  removeOnlineUser: (room_id, user_id) ->
    check room_id, String
    check user_id, String

    @chat_rooms_collection.update room_id,
      $pull:
        online_users: user_id

    return