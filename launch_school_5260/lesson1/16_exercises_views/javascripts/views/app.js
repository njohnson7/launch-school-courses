















const AppView = Backbone.View.extend({
  el:                'body',
  template:          Handlebars.templates.app,
  newPersonTemplate: Handlebars.templates.newPerson,
  events: {
    'click #add-person': 'renderNewPersonModal',
    'submit':            'addPerson',
    'click .btn-cancel': 'closeModal',
  },
  render() {
    this.$el.html(this.template())
  },
  renderNewPersonModal() {
    this.$el.append(this.newPersonTemplate())
  },
  getColors(form) {
    return [...form].filter(elem => elem.id.includes('color')).map(elem => elem.value)
  },
  addPerson(ev) {
    ev.preventDefault()
    let form       = ev.target
    let personData = { name: form.name.value, colors: this.getColors(form) }
    app.trigger('addPerson', personData)
    this.closeModal()
  },
  closeModal() {
    this.$('#new-person-modal').remove()
  },
})
