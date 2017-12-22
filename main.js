const path = require('path')
global.appRoot = path.resolve(__dirname)

const publicIp = require('public-ip')
publicIp.v4().then(ip => {
	global.appUrl = "http://"+ip
  const server = require('echoplay-server')
})
