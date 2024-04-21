Template.application_layout.events
    "click .logout": ->
        Meteor.logout()

        return