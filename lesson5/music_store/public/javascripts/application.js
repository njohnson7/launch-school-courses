const App = {
  templates: JST,
  $el:        $('main'),
  renderAlbums() {
    this.albums.forEach(this.renderAlbumView)
  },
  renderAlbumView(album) {
    new AlbumView({
      model: album,
    })
  },
  init() {
    this.renderAlbums()
  },
}
