const path   = require('path')
const Albums = require(path.resolve(path.dirname(__dirname), 'modules/albums'))

const getAlbums = _ => JSON.parse(fs.readFileSync(filePath, 'utf8')).data

module.exports = router => {
  router.get('/', (req, res, next) => {
    res.render('index', {
      albums: Albums.get(),
    })
  })
}
