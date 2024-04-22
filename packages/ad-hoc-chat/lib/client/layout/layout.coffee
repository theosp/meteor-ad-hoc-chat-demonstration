Template.application_layout.events
    "click .logout": ->
        Router.go "home_page"

        Tracker.flush() # Flushing ensures the request to go to the home page is sent before the user is logged out
                        # this is done to avoid an attempt to resubscribe to the chat when the server already recognizes
                        # the user as logged-out but the client still doesn't (without it upon logout there will
                        # be an exception thrown by the publication in the server side, complaining about @userId
                        # not being a string.

        Meteor.logout()

        return