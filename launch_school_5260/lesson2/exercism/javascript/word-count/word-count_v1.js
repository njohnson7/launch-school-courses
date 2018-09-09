const Words = function () {}

Words.prototype.count = str =>
  str.toLowerCase()
    .match(/[\w\d'ёъяшертыуиопющэасдфгчйкльжзхцвбнмâêîôûŵŷäëïöüẅÿàèìòùẁỳáéíóúẃý]+/g)
    .map(w => w.replace(/^'|'$/g, ''))
    .reduce((obj, w) => ((obj[w] = ~~obj[w] + 1), obj), {})

module.exports = Words;
