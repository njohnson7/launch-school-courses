describe('Albums View', function () {
  beforeEach(function () {
    this.view = new AlbumsView({ collection: albumsScaffold })
  })

  it('should have a `collection` property assigned', function () {
    expect(this.view.collection).toBeDefined()
    expect(this.view.collection.length).toBe(albumsScaffold.length)
  })

  it('should have a Handlebars template compiled', function () {
    expect(this.view.template).toBeDefined()
  })

  it('should render to an #albums container when render is called', function () {
    this.view.render()
    expect($('#albums li').length).toBe(albumsScaffold.length)
  })

  it('should re-render the view when the collection changes', function () {
    let model = albumsScaffold.findWhere({ artist: 'Tori Kelly' })
    this.view.render()
    let $albums      = $('#albums')
    let originalHtml = $albums.html()
    model.set('title', 'worst song')
    let newHtml = $albums.html()

    expect(originalHtml).not.toEqual(newHtml)
  })
})