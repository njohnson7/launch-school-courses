$.fx.off = true

describe('Tracks view', function () {
  let album = albumsScaffold.findWhere({ title: 'Unbreakable Smile (Bonus Track Version)' })
  beforeEach(function () {
    this.view = new TracksView({ collection: tracksScaffold, album })
  })

  afterEach(function () {
    this.view.remove()
  })

  it('has a collection property assigned', function () {
    expect(this.view.collection).toBeDefined()
    expect(this.view.collection.length).toBe(tracksScaffold.length)
  })

  it('has a Handlebars template compiled', function () {
    expect(this.view.template).toBeDefined()
  })

  it('renders a modal to the body when render called', function () {
    this.view.render()
    expect($('#tracks_modal li').length).toBe(tracksScaffold.length)
  })

  it('removes the view when fadeOut called', function () {
    this.view.fadeOut()
    expect($('#tracks_modal').length).toBe(0)
  })
})
