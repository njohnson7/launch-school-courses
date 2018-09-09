const express    = require('express')
const path       = require('path')
const router     = express.Router()
const routeFiles = ['index', 'albums']

routeFiles.forEach(file => {
  require(path.resolve(path.dirname(__dirname), `routes/${file}`))(router)
})

module.exports = router
