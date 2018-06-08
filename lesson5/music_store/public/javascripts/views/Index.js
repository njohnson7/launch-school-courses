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
{
  "skin":
  {
    "id": "origin",
    "settings":
    {
    }
  },
  "sidebar_tree_row_padding": [0, 3],
  "animation_speed": 0.1,
  "animation_interpolation": "linear",
  "text_shadow_offset": [],
  "sidebar_tree_row_padding": [0, 3],
  "sidebar_tree_row_background_color_on_selected": [
    "specify",
    ["rgba", 51, 150, 222, 0.40],
    ["rgba", 0, 0, 0, 0.05]
  ],
  "font_size": 15,
}
