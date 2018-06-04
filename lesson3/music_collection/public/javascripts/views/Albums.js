













const AlbumsView = Backbone.View.extend({
  el:       '#albums',
  template: Handlebars.compile($('[data-name=albums]').html()),
  render() {
    this.$el.html(this.template({ albums: this.collection.toJSON() }))
    this.listenTo(this.collection, 'change', this.render)
  },
})
