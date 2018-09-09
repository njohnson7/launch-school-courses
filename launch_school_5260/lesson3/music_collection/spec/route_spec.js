








const request = require('request')
const ROOT    = 'http://localhost:3000/'
let albums

describe('JSON Routes', function () {
  describe('/albums.json', function () {
    it('returns an array of albums', function (done) {
      request(`${ROOT}albums.json`, function (err, resp, body) {
        albums = JSON.parse(body)
        expect(albums[0].artist).toBeDefined()
        done()
      })
    })
  })

  describe('/albums/<album>.json', function () {
    it('returns an array of tracks', function (done) {
      request(`${ROOT}albums/${albums[0].title}.json`, function (err, resp, body) {
        expect(JSON.parse(body)[0].title).toBeDefined()
        done()
      })
    })
  })
})
