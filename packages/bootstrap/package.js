Package.describe({
  name: "daniel:bootstrap",
  version: "5.3.3",
  summary: ""
});

client = "client"
server = "server"
both = [client, server]

Package.onUse(function (api) {
  api.addFiles("bootstrap.css", client);
  api.addFiles("bootstrap.bundle.js", client);
});
