_.extend AdHocChat.prototype,
  _bothImmediateInit: ->
    @setupRouter()

    return

  _bothDeferredInit: ->
    if @destroyed
      return

    return
