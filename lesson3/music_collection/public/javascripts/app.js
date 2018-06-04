














const app = {
  albumsLoaded() {
    this.view.render()
  },
  fetchAlbums() {
    this.albums = new Albums()
    this.view   = new AlbumsView({ collection: this.albums })
    this.albums.fetch({
      success: this.albumsLoaded.bind(this)
    })
  },
  init() {
    this.fetchAlbums()
  },
}

app.init()
