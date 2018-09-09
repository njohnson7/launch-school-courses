const app = {
  albumsLoaded() {
    this.view.render()
  },
  fetchAlbums() {
    this.albums = new Albums()
    this.view   = new AlbumsView({ collection: this.albums })
    this.albums.fetch({
      success: this.albumsLoaded.bind(this)
    })
  },
  tracksLoaded(tracks) {
    let tracksModal = new TracksView({
      collection: tracks,
      album:      this.selectedAlbum.toJSON(),
    })
    tracksModal.render()
    this.tracks = tracksModal
  },
  fetchTracks(name) {
    let tracks = new (Tracks.extend({
      url: `/albums/${name}.json`,
    }))
    this.selectedAlbum = this.albums.findWhere({ title: name })
    tracks.fetch({
      success: this.tracksLoaded.bind(this)
    })
  },
  init() {
    this.fetchAlbums()
  },
}

const Router = Backbone.Router.extend({
  routes: {
    'albums/:name': 'getAlbum',
  },
  getAlbum(name) {
    app.fetchTracks(name)
  },
  index() {
    if (!app.tracks.$el.is(':animated')) app.tracks.fadeOut()
  },
  initialize() {
    this.route(/^\/?$/, 'index', this.index)
  },
})

let router = new Router()

Backbone.history.start({
  pushState: true,
  silent:    true,
})

$(document).on('click', 'a[href^="/"]', function (ev) {
  ev.preventDefault()
  p(ev)
  router.navigate($(ev.currentTarget).attr('href').replace(/^\//, ''), { trigger: true })
})

app.init()
