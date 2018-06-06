const App = {
  templates:  JST,
  $el:        $('main'),
  indexView() {
    this.index = new IndexView()
    this.renderAlbums()
    this.bindEvents()
  },
  renderAlbums() {
    this.albums.forEach(this.renderAlbumView)
  },
  renderAlbumView(album) {
    new AlbumView({
      model: album,
    })
  },
  newAlbum() {
    new NewAlbumView()
  },
  bindEvents() {
    _.extend(this, Backbone.Events)
    this.listenTo(this.index, 'add_album', this.newAlbum)
  },
}

Handlebars.registerHelper('formatPrice', price => (+price).toFixed(2))
