const express = require('express')
const router  = express.Router()
const _       = require('underscore')

module.exports = function (app) {
  const setActiveNavTo = title => {
    let activeItem = _(app.locals.links).findWhere({ active: true })
    if (activeItem) activeItem.active = false
    _(app.locals.links).findWhere({ title }).active = true
  }

  // GET home page
  router.get('/', function (req, res, next) {
    let title = 'Home'
    setActiveNavTo(title)
    res.render('index', { title })
  })

  router.get('/about', function (req, res, next) {
    let title = 'About'
    setActiveNavTo(title)
    res.render('about', { title })
  })

  return router
}
