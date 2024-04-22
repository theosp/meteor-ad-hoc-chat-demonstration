_.extend AdHocChat.prototype,
  _immediateInit: ->
    return

  _deferredInit: ->
    if @destroyed
      return
    
    return

  createAccountFromNickname: (nickname, cb) ->
    if not _.isString(nickname) or _.isEmpty(nickname) or nickname.length > AdHocChat.max_nickname_length
      if _.isFunction(cb)
        cb new Meteor.Error "invalid-nickname", "Nickname must be at least #{AdHocChat.max_nickname_length} characters long"

        return
    
    Accounts.callLoginMethod
      methodName: "createUser"
      methodArguments: [{
        username: Random.id()
        profile:
          nickname: nickname
      }]

    return

  subscribeChatRoom: (chat_room_id) ->
    if not _.isString(chat_room_id) or _.isEmpty(chat_room_id)
      throw new Meteor.Error "invalid-chat-room-id", "Chat room ID must be a non-empty string"

      return

    Meteor.subscribe "chat_room", chat_room_id

    return

  getCurrentRoomId: ->
    return Router.current().params.id

  getCurrentRoom: ->
    return @chat_rooms_collection.findOne @getCurrentRoomId() 
  