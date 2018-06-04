














const Album = Backbone.Model.extend({
  parse(attrs) {
    attrs.tracksUrl = `/album/${attrs.title}`
    return attrs
  },
})
