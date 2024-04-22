AdHocChat = (options) ->
  EventEmitter.call @

  @destroyed = false

  @_on_destroy_procedures = []

  @chat_rooms_collection = options.chat_rooms_collection
  @chat_messages_collection = options.chat_messages_collection

  @_attachCollectionsSchemas()

  if Meteor.isClient
    # React to invalidations
    if Tracker.currentComputation?
      Tracker.onInvalidate =>
        console.log "Enclosing computation invalidated, destroying"
        @destroy() # defined in client/api.coffee

        return

    # on the client, call @_immediateInit() in an isolated
    # computation to avoid our init procedures from affecting
    # the encapsulating computation (if any)
    Tracker.nonreactive =>
      @_bothImmediateInit()

      @_immediateInit()

      return

  else
    @_bothImmediateInit()

    @_immediateInit()

  Meteor.defer =>
    @_bothDeferredInit()
    @_deferredInit()

    return
  
  return @

Util.inherits AdHocChat, EventEmitter

_.extend AdHocChat.prototype,
  onDestroy: (proc) ->
    # not to be confused with @destroy, onDestroy registers procedures to be called by @destroy()
    @_on_destroy_procedures.push proc

    return

  destroy: ->
    if @destroyed
      console.log "Destroyed already"

      return

    _.each @_on_destroy_procedures, (proc) -> proc()

    @destroyed = true

    console.log "Destroyed"

    return
