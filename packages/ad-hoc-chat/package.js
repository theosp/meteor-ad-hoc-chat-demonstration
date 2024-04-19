Package.describe({
  name: "daniel:ad-hoc-chat",
  version: "1.0.0",
  summary: ""
});

client = "client"
server = "server"
both = [client, server]

Package.onUse(function (api) {
  api.use("coffeescript", both);
  api.use("underscore", both);
  api.use("mongo", both);
  api.use("random", both);
  api.use("jquery@3.0.0", both);

  api.use("meteorspark:app", both);
  api.use("meteorspark:util", both);
  
  api.use("ecmascript", both);

  api.use("templating", both);
  api.use("fourseven:scss", both);

  api.use("aldeed:simple-schema", both);
  api.use("raix:eventemitter", both);
  api.use("iron:router", both);

  api.use("matb33:collection-hooks", both);

  api.use("reactive-var", both);
  api.use("tracker", client);

  api.use("accounts-base", both);
  api.use("accounts-password", both);

  api.addFiles("lib/both/init.coffee", both);
  api.addFiles("lib/both/static.coffee", both);
  api.addFiles("lib/both/router.coffee", both);
  api.addFiles("lib/both/api.coffee", both);
  api.addFiles("lib/both/schemas.coffee", both);

  api.addFiles("lib/server/api.coffee", server);
  api.addFiles("lib/server/collections-hooks.coffee", server);
  api.addFiles("lib/server/collections-indexes.coffee", server);
  api.addFiles("lib/server/methods.coffee", server);
  api.addFiles("lib/server/publications.coffee", server);

  api.addFiles("lib/client/api.coffee", client);
  api.addFiles("lib/client/methods.coffee", client);

  api.addFiles("lib/client/global-template-helpers.coffee", client);
  api.addFiles("lib/client/layout/layout.sass", client);
  api.addFiles("lib/client/layout/layout.html", client);

  api.addFiles("lib/client/pages/chat-room/chat-room-layout.html", client);
  api.addFiles("lib/client/pages/chat-room/chat-room-layout.sass", client);
  api.addFiles("lib/client/pages/chat-room/chat-room-layout.coffee", client);

  api.addFiles("lib/client/pages/chat-room/chat-room-setup.html", client);
  api.addFiles("lib/client/pages/chat-room/chat-room-setup.sass", client);
  api.addFiles("lib/client/pages/chat-room/chat-room-setup.coffee", client);

  api.addFiles("lib/client/pages/chat-room/chat-room.html", client);
  api.addFiles("lib/client/pages/chat-room/chat-room.sass", client);
  api.addFiles("lib/client/pages/chat-room/chat-room.coffee", client);

  api.addFiles("lib/client/pages/chat-room/logout-state.html", client);
  api.addFiles("lib/client/pages/chat-room/logout-state.sass", client);
  api.addFiles("lib/client/pages/chat-room/logout-state.coffee", client);

  api.addFiles("lib/client/pages/home-page/home-page.html", client);
  api.addFiles("lib/client/pages/home-page/home-page.coffee", client);

  api.use("daniel:bootstrap", client);

  api.addFiles("lib/both/app-integration.coffee", both);

  api.addAssets("assets/logo.png", client);

  api.export("AdHocChat", both);
});
