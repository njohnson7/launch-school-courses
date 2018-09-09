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
  readStorage() {
    let storedCart = JSON.parse(localStorage.getItem('cart'))
    this.reset(storedCart)
    this.setTotal().setQuantity()
  },
  updateStorage() {
    localStorage.setItem('cart', JSON.stringify(this.toJSON()))
  },
  addItem(item) {
    let existing = this.get(item.get('id'))
    if (existing) {
      existing.set('quantity', existing.get('quantity') + 1)
    } else {
      item = item.clone()
      item.set('quantity', 1)l1l1Ii
      this.add(item)
    }
    this.update()
    this.trigger('cart_updated')
  },
  destroy(id) {
    this.remove(id)
    this.update()
  },
  update() {
    this.setTotal().setQuantity().updateStorage()
  },
  initialize() {
    this.readStorage()
    this.on('destroy', this.destroy)
  },
})
