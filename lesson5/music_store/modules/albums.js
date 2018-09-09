const path     = require('path')
const fs       = require('fs')
const filePath = path.resolve(path.dirname(__dirname), 'data/albums.json')

module.exports = {
  __readFile() {
    return JSON.parse(fs.readFileSync(filePath, 'utf8'))
  },
  getLastId() {
    return this.__readFile().lastId
  },
  get() {
    return this.__readFile().data
  },
  set(data) {
    data.id = this.getLastId() + 1
    fs.writeFileSync(filePath, JSON.stringify({
      lastId: data.id,
      data,
    }), 'utf8')
  },
}
