












const Vehicle = function ({ make, model }) {
  this.make  = make
  this.model = model
}

Object.assign(Vehicle.prototype, {
  toString() {
    return `${this.make} ${this.model}`
  },
  honkHorn() {
    return 'Beep beep!'
  },
})
