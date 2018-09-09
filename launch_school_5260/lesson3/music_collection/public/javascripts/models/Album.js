














const Album = Backbone.Model.extend({
  parse(attrs) {
    attrs.tracksUrl = `/albums/${attrs.title}`
    return attrs
  },
})
