const Words = function () {}

Words.prototype.count = str =>
  str.toLowerCase()
    .match(/\w+'\w+|[\w\u0400-\u04FFÀ-ÿ]+/g)
    .reduce((obj, w) => (obj[w] = ~~obj[w] + 1, obj), {})

module.exports = Words;
