const App = {
  templates:  JST,
  $el:        $('main'),
  indexView() {
    this.index = new IndexView()
    this.renderAlbums()
    this.createCart()
    this.bindEvents()
  },
  renderAlbums() {
    this.albums.forEach(this.renderAlbumView)
  },
  createCart() {
    this.cart      = new CartItems()
    this.cart.view = new CartView({
      collection: this.cart,
    })
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
    this.on('add_to_cart', this.cart.addItem.bind(this.cart))
  },
}

Handlebars.registerHelper('formatPrice', price => (+price).toFixed(2))
