APP.collections.chat_rooms_collection = new Mongo.Collection "chat_rooms"
APP.collections.chat_messages_collection = new Mongo.Collection "chat_messages"

APP.ad_hoc_chat = new AdHocChat
    chat_rooms_collection: APP.collections.chat_rooms_collection
    chat_messages_collection: APP.collections.chat_messages_collection