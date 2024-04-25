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
          if not (room_doc = self.getCurrentRoom())?
            return
          
          users = self.getOnlineUsersInRoomDoc(room_doc)

          # In addition to the online users, we also want to subscribe to the public basic user info of
          # all users that have sent a message in the room

          APP.ad_hoc_chat.getRoomMessagesCursor(room_doc._id).map (message_doc) ->
            users.push message_doc.user_id

          # Remove duplicates and sort to keep the request consistent
          users = _.uniq users
          users.sort()

          self.subscribePublicBasicUserInfo(users)

          return
          

      return
    ,
      name: "chat_room"

    return