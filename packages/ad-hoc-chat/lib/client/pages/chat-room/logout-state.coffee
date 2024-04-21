nickname_input_selector = ".nickname"

Template.chat_room_logged_out.onCreated ->
    Helpers.addErrorsFacilityToTemplateInstance(@)

    @attemptLogin = ->
        @clearErrors()

        nickname = @$(nickname_input_selector).val()

        nickname = nickname.trim()

        if _.isEmpty(nickname)
            return
        
        if nickname.length > AdHocChat.max_nickname_length
            @addError("Please enter a nickname that is less than #{AdHocChat.max_nickname_length} characters")
            return

        APP.ad_hoc_chat.createAccountFromNickname nickname, (err, res) =>
            if err?
                @addError(err)
                return

            return

        return

    return

Template.chat_room_logged_out.onRendered ->
    # focus on the nickname input
    @$(nickname_input_selector).focus()

    return

Template.chat_room_logged_out.helpers
    errors: -> Template.instance().getErrors()

    hasErrors: -> Template.instance().hasErrors()

Template.chat_room_logged_out.events
    "keyup #{nickname_input_selector}": (e, tpl) ->
        tpl.clearErrors()

        # Check if enter was pressed
        if e.which isnt Helpers.enter_key_code
            return

        tpl.attemptLogin()

        return
    
    "click .join": (e, tpl) ->
        tpl.attemptLogin()

        return