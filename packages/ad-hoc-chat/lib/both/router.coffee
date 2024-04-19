_.extend AdHocChat.prototype,
  setupRouter: ->
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

      return
    ,
      name: "chat_room"

    return