var text = 'The quick brown fox jumps over the lazy dog.';

function capitalize(str) {
  return str.replace(/\b\w/, char => char.toUpperCase());
}

function capitalize(str) {
  return str.split(' ').map(word => word[0].toUpperCase() + word.slice(1)).join(' ');
}

console.log(capitalize(text));




var text = 'The quick brown fox jumps over the lazy dog.';

function countWord(word, str) {
  return str.match(RegExp(word, 'gi')).length;
}

console.log(countWord('the', text));
console.log(countWord('dog', text));
