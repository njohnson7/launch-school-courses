let albumsScaffold = new Albums()
albumsScaffold.reset([{
  "artist": "Tori Kelly",
  "title":  "Unbreakable Smile (Bonus Track Version)",
  "url":    "https://itunes.apple.com/us/album/unbreakable-smile-bonus-track/id988591612?v0=WWW-NAUS-ITSTOP100-ALBUMS&l=en&ign-mpt=uo%3D4",
  "date":   "Jun 23, 2015",
  "cover":  "http://a5.mzstatic.com/us/r30/Music5/v4/83/10/90/83109037-0c67-bf88-a2c5-a022b21de7d7/cover170x170.jpeg"
}, {
  "artist": "Taylor Swift",
  "title":  "1989",
  "url":    "https://itunes.apple.com/us/album/1989/id907242701?v0=WWW-NAUS-ITSTOP100-ALBUMS&l=en&ign-mpt=uo%3D4",
  "date":   "Oct 27, 2014",
  "cover":  "http://a3.mzstatic.com/us/r30/Music5/v4/29/fa/b6/29fab67f-c950-826f-26a0-5eebcd0e262b/cover170x170.jpeg"
}, {
  "artist": "Breaking Benjamin",
  "title":  "Dark Before Dawn",
  "url":    "https://itunes.apple.com/us/album/dark-before-dawn/id975950518?v0=WWW-NAUS-ITSTOP100-ALBUMS&l=en&ign-mpt=uo%3D4",
  "date":   "Jun 23, 2015",
  "cover":  "http://a3.mzstatic.com/us/r30/Music1/v4/20/7d/35/207d354b-c1e7-c199-d363-9269d0be9376/cover170x170.jpeg"
}])

describe('Albums View', function () {
  let $albums = $('<ul>').attr('id', 'albums').hide().appendTo(document.body)

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
    let originalHtml = $albums.html()
    model.set('title', 'worst song')
    let newHtml = $albums.html()

    expect(originalHtml).not.toEqual(newHtml)
  })
})