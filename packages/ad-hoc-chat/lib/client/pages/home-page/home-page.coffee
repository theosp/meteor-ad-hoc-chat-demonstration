Template.home_page.events
    "click .create-new-room": ->
        uniqueRoomId = Random.id(AdHocChat.random_chat_room_id_length)

        Router.go("chat_room", {id: uniqueRoomId})

        return