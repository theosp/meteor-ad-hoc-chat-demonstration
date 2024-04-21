Package.describe({
    name: "daniel:helpers",
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
  
    api.addFiles("lib/both/init.js", both);
    api.addFiles("lib/both/constants.coffee", both);

    api.addFiles("lib/client/blaze.coffee", client);

    api.export("Helpers", both);
  });
  