const static = require('node-static')
const http   = require('http')

const fileServer = new static.Server('./public')

http.createServer(function (request, response) {
  request.addListener('end', function () {
    fileServer.serve(request, response, function (err, result) {
      console.log(request.url)
      if (err) {
        console.error(`Error serving ${request.url} -- ${err.message}`)

        // Respond to the client
        response.writeHead(err.status, err.headers)
        response.end()
      }
    })
  }).resume()
}).listen(3000)
