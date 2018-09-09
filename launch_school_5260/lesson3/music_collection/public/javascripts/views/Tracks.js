













const $overlay = $('#overlay')

const TracksView = Backbone.View.extend({
  attributes: {
    id: 'tracks_modal',
  },
  events: {
    'click a.close': 'close',
  },
  duration: 300,
  template: Handlebars.compile($('[data-name=tracks]').html()),
  open() {
    this.$el.add($overlay).fadeIn(this.duration)
  },
  fadeOut() {
    $overlay.fadeOut(this.duration)
    this.$el.fadeOut(this.duration, function () {
      this.remove()
    }.bind(this))
  },
  close(ev) {
    ev.preventDefault()
    this.fadeOut()
    history.back()
  },
  render() {
    this.$el.html(this.template({
      tracks: this.collection.toJSON(),
      album:  this.album,
    }))
    this.open()
  },
  initialize(options) {
    this.album = options.album
    this.$el.appendTo(document.body)
  },
})
