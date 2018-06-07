const CartItems = Backbone.Collection.extend({
  getTotal() {
    return this.total
  },
  setTotal() {
    this.total = this.toJSON().reduce((sum, obj) => sum + obj.price * obj.quantity, 0)
    return this
  },
  getQuantity() {
    return this.quantity
  },
  setQuantity() {
    this.quantity = this.toJSON().reduce((sum, obj) => sum + obj.quantity, 0)
    return this
  },
  addItem(item) {
    let existing = this.get(item.get('id'))
    if (existing) {
      existing.set('quantity', existing.get('quantity') + 1)
    } else {
      item = item.clone()
      item.set('quantity', 1)
      this.add(item)
    }
    this.setTotal().setQuantity().trigger('cart_updated')
  },
})
