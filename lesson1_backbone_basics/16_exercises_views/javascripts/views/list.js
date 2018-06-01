















const ListView = Backbone.View.extend({
  el: '#favorites',
  renderOne(model) {
    model = model || this.collection.last()
    let listItemView = new ListItemView({ model })
    this.$el.append(listItemView.render())
  },
  render() {
    this.collection.forEach(this.renderOne, this)
  },
  initialize() {
    this.listenTo(this.collection, 'add', this.renderOne)
  },
})
