default_toast_options =
    title: "Title"
    content: "Content"
    delay: 10000

_.extend Helpers,
    toast: (options) ->
        options = _.extend {}, default_toast_options, options

        # remove all toasts
        $(".toast-container").remove()

        # Add a toast to the dom
        toast_html = """
            <div class="toast-container position-fixed bottom-0 end-0 p-3">
                <div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="#{options.delay}">
                    <div class="toast-header">
                        <strong class="me-auto">#{options.title}</strong>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>

                    <div class="toast-body">#{options.content}</div>
                </div>
            </div>
        """
        $toast_container = $(toast_html)
        toast_dom_pointer = $toast_container.find(".toast").get(0)

        # Add the toast to the dom
        $("body").append($toast_container)

        # Show the toast
        toast_bootstrap = bootstrap.Toast.getOrCreateInstance(toast_dom_pointer)

        # Toast
        toast_bootstrap.show()

        toast_dom_pointer.addEventListener "hidden.bs.toast", ->
            $toast_container.remove()

            return

        return
