_.extend AdHocChat.prototype,
  _setupMethods: ->
    self = @

    Meteor.methods
      createAccountFromNickname: (nickname) ->
        check nickname, String
        return self.createAccountFromNickname nickname

    return