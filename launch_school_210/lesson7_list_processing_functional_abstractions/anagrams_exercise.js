const anagram = (word, list) => list.filter(w => sortStr(w) === sortStr(word));
const sortStr = str => str.split('').sort().join('');

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));
// [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));
// [ "enlist", "inlets" ]
