
















const people = [
  { name: 'Bob',   colors: [1, 2, 3] },
  { name: 'Fred',  colors: [4, 5, 6] },
  { name: 'Jonas', colors: [7, 8, 9] },
]

const app = {
  bindEvents() {
    _.extend(this, Backbone.Events)
    this.on('addPerson', function (personData) {
      this.list.add(personData)
    })
  },
  init() {
    this.appView = new AppView()
    this.appView.render()

    this.list     = new List(people)
    this.listView = new ListView({ collection: this.list })
    this.listView.render()
  },
}

app.init()
