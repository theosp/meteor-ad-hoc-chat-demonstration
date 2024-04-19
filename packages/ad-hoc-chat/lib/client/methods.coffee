_.extend AdHocChat.prototype,
  createAccountFromNickname: (nickname, cb) ->
    check nickname, String

    Meteor.call "createAccountFromNickname", nickname, (err, res) ->
      if err
        return cb err

      return cb null, res
    
    return