_.extend AdHocChat.prototype,
  setupRouter: ->
    self = this

    Router.configure({
      layoutTemplate: 'application_layout'
    });

    Router.route "/", ->
      @render "home_page"

      return
    ,
      name: "home_page"

    Router.route "/:id", ->
      @render "chat_room_layout"

      if Meteor.userId()?
        self.subscribeChatRoom @params.id

        Tracker.autorun (c) ->
          if (room_doc = self.getCurrentRoom())?
            self.subscribePublicBasicUserInfo(self.getOnlineUsersInRoomDoc(room_doc))

          return
          

      return
    ,
      name: "chat_room"

    return