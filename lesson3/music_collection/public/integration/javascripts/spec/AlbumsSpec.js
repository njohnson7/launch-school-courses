














describe('Albums collection', function () {
  it('fetches a collection of three albums', function (done) {
    let albumsLoaded = app.albumsLoaded
    app.albumsLoaded = function () {
      albumsLoaded.apply(app, arguments)
      expect(app.albums.models.length).toBe(3)
      expect(app.albums.models[0].attributes.title).toEqual(jasmine.any(String))
      done()
    }

    app.init()
  })

  it('sets a tracksUrl property when models are created', function (done) {
    app.albumsLoaded = function () {
      expect(app.albums.first().get('tracksUrl')).toMatch(/\/album/)
      done()
    }

    app.init()
  })
})
