_.extend AdHocChat,
  app_human_readable_name: "Ad-Hoc Chat"
  
  random_chat_room_id_length: 80 # This isn't a limit but only sets the default length
                                 # by editing the url's id part the user can even set
                                 # a custom id for the chat room of any length (the limits
                                 # are actually the MongoDB's limits)

  max_nickname_length: 50

  max_room_title_length: 50

  max_message_length: 10000