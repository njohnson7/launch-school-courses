const express = require('express')
const router  = express.Router()
const fs      = require('fs')
const path    = require('path')

router.get('/', (req, res, next) => {
  let products = fs.readFileSync(path.resolve(path.dirname(__dirname), 'public/products.json'), 'utf8')
  res.render('index', {
    products: JSON.parse(products),
  })
})

module.exports = router
