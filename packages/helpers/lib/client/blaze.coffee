_.extend Helpers,
    addErrorsFacilityToTemplateInstance: (template_instance) ->
        # errors is an array of strings representing error messages
        template_instance.errors = []
        template_instance.errors_tracker = new Tracker.Dependency()

        template_instance.clearErrors = ->
            @errors = []
            @errors_tracker.changed()
        
            return
        
        template_instance.addError = (error) ->
            if _.isError(error)
                error = error.message
            else if _.isObject(error) and _.isString(error.reason) and not _.isEmpty(error.reason)
                error = error.reason
            else if not _.isString(error)
                console.error('An unknown error provided to addError()')

                error = 'Unknown error'

            @errors.push(error) 
            @errors_tracker.changed()        

            return
        
        template_instance.getErrors = ->
            @errors_tracker.depend()
            return @errors

        template_instance.hasErrors = ->
            return @getErrors().length > 0

        return