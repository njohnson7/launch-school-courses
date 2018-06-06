const NewAlbumView = Backbone.View.extend({
  template: App.templates.newAlbum,
  attributes: {
    id: 'album_new',
  },
  render() {
    this.$el.html(this.template())
    App.$el.html(this.$el)
  },
  initialize() {
    this.render()
  },
})
