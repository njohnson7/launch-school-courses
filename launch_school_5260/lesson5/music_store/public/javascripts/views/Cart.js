const CartView = Backbone.View.extend({
  template: App.templates.cart,
  el:       '#cart',
  events: {
    'click a': 'destroy',
  },
  destroy(ev) {
    ev.preventDefault()
    this.collection.trigger('destroy', ev.target.dataset.id)
    this.render()
  },
  render() {
    this.$el.html(this.template({
      items:    this.collection.toJSON(),
      quantity: this.collection.getQuantity(),
      total:    this.collection.getTotal(),
    }))
  },
  initialize() {
    this.render()
    this.listenTo(this.collection, 'cart_updated', this.render)
  },
})
