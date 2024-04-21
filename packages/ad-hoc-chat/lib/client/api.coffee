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