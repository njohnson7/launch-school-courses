const IndexView = Backbone.View.extend({
  template: App.templates.index,
  attributes: {
    id: 'index',
  },
  events: {
    'click footer a': 'addAlbum',
  },
  addAlbum(ev) {
    ev.preventDefault()
    this.trigger('add_album')
  },
  render() {
    this.$el.html(this.template())
    App.$el.html(this.$el)
  },
  initialize() {
    this.render()
  },
})
