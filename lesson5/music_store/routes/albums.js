const path   = require('path')
const _      = require('underscore')
const Albums = require(path.resolve(path.dirname(__dirname), 'modules/albums'))

module.exports = router => {
  router.route('/albums')
    .get((req, res) => {
      res.json(Albums.get())
    })
    .post((req, res) => {
      let album  = req.body
      let albums = Albums.get()
      album.id   = Albums.getLastId() + 1
      albums.push(album)
      Albums.set(albums)
      res.json(album)
    })
    .put((req, res) => {
      let albums       = Albums.get()

      console.log(req.body)

      let currentAlbum = _(albums).findWhere({ id: +req.body.id })
      _.extend(currentAlbum, req.body)
      Albums.set(albums)
      res.json(currentAlbum)
    })
    .delete((req, res) => {
      let albums = Albums.get().filter(album => album.id != req.body.id)
      Albums.set(albums)
      res.status(200).end()
    })

  router.get('/albums/new', (req, res) => {
    res.render('new')
  })
}
