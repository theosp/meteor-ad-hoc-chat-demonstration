_.extend AdHocChat.prototype,
  _immediateInit: ->
    @_removeAllOnlineUsers()
    
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

  _removeAllOnlineUsers: ->
    # This is used when the server restarts - to remove all lignering online users records from
    # all the rooms.
    #
    # If the server is fails in the middle of the operation, the online users won't
    # be removed from the chat rooms properly.
    #
    # Note, this will need to be implemented in a different way if more than one server is used.
    #
    # This implementation assumes a single server.
    @chat_rooms_collection.update {},
      $unset:
        online_users: ""
    ,
      multi: true

    return

  setChatRoomTitle: (options, user_id) ->
    check options,
      room_id: String
      title: String

    check user_id, String

    if options.title.length is 0 or options.title.length > AdHocChat.max_room_title_length
      throw new Meteor.Error "invalid-title", "Title must be at most #{AdHocChat.max_room_title_length} characters long"

    @chat_rooms_collection.upsert options.room_id,
      $set:
        title: options.title

    return

  getOnlineUserKey: (publish_this) ->
    # The unique key for an online user is the subscription id and the user id
    # this is done to deal with the following scenario:
    # 1. User A opens the chat room
    # 2. User A opens the chat room in another tab
    # 3. User A closes the chat room in one of the tabs
    # 4. User A is still online in the chat room
    #
    # If we were to use only the user id as the unique key, then when the user closes the chat room in one tab
    # the user would be removed from the online users list, which is not the desired behavior.
    #
    # IMPORTANT, if you change this method, you must also change the method in the both/api.coffee
    # named getOnlineUserFromKey
    return "#{publish_this._subscriptionId}:#{publish_this.userId}"

  addOnlineUser: (publish_this, room_id) ->
    check room_id, String
    check publish_this.userId, String

    @chat_rooms_collection.upsert room_id,
      $addToSet:
        online_users: @getOnlineUserKey(publish_this)

    return

  removeOnlineUser: (publish_this, room_id) ->
    check room_id, String
    check publish_this.userId, String

    @chat_rooms_collection.update room_id,
      $pull:
        online_users: @getOnlineUserKey(publish_this)

    return
    
  sendMessage: (message_doc, user_id) ->
    check user_id, String

    # validate the message_doc using the chat_messages_collection schema
    @chat_messages_collection.simpleSchema().validate(message_doc);

    # message_doc is validated in the schema
    @chat_messages_collection.insert message_doc

    return
