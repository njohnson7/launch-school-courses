const App = {
  templates:  JST,
  $el:        $('main'),
  indexView() {
    this.indexView = new IndexView()
    this.renderAlbums()
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
    this.listenTo(this.indexView,  'add_album', this.newAlbum)
  },
  init() {
    this.indexView()
    this.bindEvents()
  },
}

Handlebars.registerHelper('formatPrice', price => (+price).toFixed(2))
