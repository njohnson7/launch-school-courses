const NewAlbumView = Backbone.View.extend({
  template:   App.templates.newAlbum,
  attributes: {
    id: 'album_new',
  },
  events: {
    submit: 'create',
  },
  render() {
    this.$el.html(this.template())
    App.$el.html(this.$el)
  },
  create(ev) {
    ev.preventDefault()
    let $f = this.$('form')
    $.ajax({
      url:  $f.attr('action'),
      type: $f.attr('method'),
      data: $f.serialize(),
      success(json) {
        App.albums.add(json)
        App.indexView()
      },
    })
  },
  initialize() {
    this.render()
  },
})
