_.extend AdHocChat.prototype,
  createAccountFromNickname: (nickname, cb) ->
    check nickname, String

    Meteor.call "createAccountFromNickname", nickname, (err, res) ->
      if _.isFunction cb
        cb(err, res)
        
      return
    
    return