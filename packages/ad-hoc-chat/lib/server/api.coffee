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

  createAccountFromNickname: (nickname) ->
    check nickname, String

    if _.isEmpty(nickname) or nickname.length > AdHocChat.max_nickname_length
      throw new Meteor.Error "invalid-nickname", "Nickname must be at least #{AdHocChat.max_nickname_length} characters long"

    return