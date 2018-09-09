














const Honda = function (model) {
  this.make  = 'Honda'
  this.verify(model)
  this.model = model
  this.price = Honda.getPrice(model)
}

Object.assign(Honda, {
  MODELS: ['Accord', 'Civic', 'Crosstour', 'CR-V', 'CR-Z', 'Fit', 'HR-V', 'Insight', 'Odyssey', 'Pilot'],
  PRICES: [16500,    14500,   21000,       15800,  12000,  13100, 16000,  18100,     22500,     19300],
  getPrice(model) {
    return this.PRICES[this.MODELS.indexOf(model)]
  },
  getModels() {
    return [...this.MODELS]
  }
})


Honda.prototype = Object.assign(Object.create(Vehicle.prototype), {
  constructor: Honda,
  verify(model) {
    if (!Honda.MODELS.includes(model)) throw Error(`Model ${model} does not exist`)
  },
},)