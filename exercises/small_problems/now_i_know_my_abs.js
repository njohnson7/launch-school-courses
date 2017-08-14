/*
- input:  word String
- output: Boolean
  - true if word can be spelled from blocks
  - false if not

- rules:
  - case insensitve

- DS:
  - array of 2 char strings to hold blocks
*/



// const isBlockWord = (word, m) => {
//   return !['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']
//     .some(block => (m = word.match(RegExp(`[${block}]`, 'gi'))) && m.length > 1);
// };


// const isBlockWord = word => {
//   return !['BO', 'XK', 'DQ', 'CP', 'NA', 'GT', 'RE', 'FS', 'JW', 'HU', 'VI', 'LY', 'ZM']
//     .some(block => (word.match(RegExp(`[${block}]`, 'gi')) || []).length > 1);
// };



// const isBlockWord = (word, r = '[BO]|[XK]|[DQ]|[CP]|[NA]|[GT]|[RE]|[FS]|[JW]|[HU]|[VI]|[LY]|[ZM]') => {
//   if (word.length === 0) return true;
//   return RegExp(r, 'i').test(word[0]) ? isBlockWord(word.slice(1), r.replace(RegExp(`\\[.?${word[0]}.?]\\|?`, 'i'), '')) : false;
// };


// const isBlockWord = (w, r = '[BO]|[XK]|[DQ]|[CP]|[NA]|[GT]|[RE]|[FS]|[JW]|[HU]|[VI]|[LY]|[ZM]') => {
//   return w ? RegExp(r, 'i').test(w[0]) ? isBlockWord(w.slice(1), r.replace(RegExp(`\\[.?${w[0]}.?]\\|?`, 'i'), '')) : false : true;
// };



// const isBlockWord = (w, r = '[BO]|[XK]|[DQ]|[CP]|[NA]|[GT]|[RE]|[FS]|[JW]|[HU]|[VI]|[LY]|[ZM]') => {
//   return !w || RegExp(r, 'i').test(w[0]) && isBlockWord(w.slice(1), r.replace(RegExp(`\\[.?${w[0]}.?]\\|?`, 'i'), ''));
// };



const isBlockWord = (word, pat = '[BO]|[XK]|[DQ]|[CP]|[NA]|[GT]|[RE]|[FS]|[JW]|[HU]|[VI]|[LY]|[ZM]') => {
  return !word || RegExp(pat, 'i').test(word[0]) &&
    isBlockWord(word.slice(1), pat.replace(RegExp(`\\[.?${word[0]}.?]\\|?`, 'i'), ''));
};



console.log(isBlockWord('BATCH')); // true
console.log(isBlockWord('BUTCH')); // false
console.log(isBlockWord('jest'));  // true

console.log('======');

console.log(isBlockWord('BATCH') === true);
console.log(isBlockWord('BUTCH') === false);
console.log(isBlockWord('jest') ===  true);

console.log(isBlockWord('BATCH') === true);
console.log(isBlockWord('BUTCH') === false);
console.log(isBlockWord('jest') ===  true);
console.log(isBlockWord('floW') ===  true);
console.log(isBlockWord('APPLE') === false);
console.log(isBlockWord('apple') === false);
console.log(isBlockWord('apPLE') === false);
console.log(isBlockWord('Box') ===   false);
