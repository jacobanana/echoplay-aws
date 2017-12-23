const path = require('path')
const {EchoPlayServer} = require('echoplay-server')

var server = new EchoPlayServer(path.resolve(__dirname), process.env.URL, process.env.PORT)
server.start()
