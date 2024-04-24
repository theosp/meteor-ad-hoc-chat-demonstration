_.extend AdHocChat.prototype,
  _bothImmediateInit: ->
    @setupRouter()

    return

  _bothDeferredInit: ->
    if @destroyed
      return

    return

  getOnlineUserFromKey: (key) ->
    # IMPORTANT, if you change this method, you must also change the method in the server/api.coffee
    # named getOnlineUserKey
    return key.split(":")[1]

  getOnlineUsersInRoomDoc: (room_doc) ->
      return _.map room_doc.online_users, (user_key) ->
          return APP.ad_hoc_chat.getOnlineUserFromKey(user_key)