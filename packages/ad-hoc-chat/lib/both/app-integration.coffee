Meteor._ensure(APP, "Collection")

APP.Collection.chat_rooms_collection = new Mongo.Collection "chat_rooms"
APP.Collection.chat_messages_collection = new Mongo.Collection "chat_messages"

APP.ad_hoc_chat = new AdHocChat
    chat_rooms_collection: APP.Collection.chat_rooms_collection
    chat_messages_collection: APP.Collection.chat_messages_collection