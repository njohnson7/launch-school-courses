const DnaTranscriber = function () {}

DnaTranscriber.prototype.toRna = dna => {
  if (!/^[ACGT]+$/.test(dna)) throw(Error('Invalid input'))
  return dna.replace(/[ACGT]/g, m => ({ A: 'U', C: 'G', G: 'C', T: 'A' })[m])
}

module.exports = DnaTranscriber
