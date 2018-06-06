const router = new (Backbone.Router.extend({
  routes: {
    'albums/new': App.newAlbum,
  },
  index() {
    App.indexView()
  },
  initialize() {
    this.route(/^\/?$/, 'index', this.index)
  },
}))()

Backbone.history.start({
  pushState: true,
})

$(document).on('click', 'a[href^="/"]', ev => {
  ev.preventDefault()
  router.navigate($(ev.currentTarget).attr('href').replace('/', ''), { trigger: true })
})
