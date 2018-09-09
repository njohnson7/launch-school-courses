function toLowerCase(str) {
  for (var i = 0, result = '', ord; i < str.length; i++) {
    ord = str[i].charCodeAt(0);
    result += ord <= 90 && ord >= 65 ? String.fromCharCode(ord + 32) : str[i];
  }

  return result;
}

console.log(toLowerCase('ALPHABET'));  // "alphabet"
console.log(toLowerCase('123'));       // "123"
console.log(toLowerCase('abcDEF'));    // "abcdef"

'miXedCase1Word'.toLowerCase(); // "mixedcase1word"
'miXedCase1Word'.toUpperCase(); // "MIXEDCASE1WORD"
