function repeat(str, times) {
  if (typeof times !== 'number' || isNaN(times) || times < 0) return undefined;
  for (var i = 0, result = ''; i < times; i++) result += str;
  return result;
}

console.log(repeat('abc', 1));    // "abc"
console.log(repeat('abc', 2));    // "abcabc"
console.log(repeat('abc', -1));   // undefined
console.log(repeat('abc', 0));    // ""
console.log(repeat('abc', 'a'));  // undefined

// String.prototype.repeat(times);
// 'abcd'.repeat(times);
'abcd'.repeat(3);   // abcdabcdabcd
'abcd'.repeat('a'); // ""
'abcd'.repeat(1.6); // "abcd"
'abcd'.repeat(1/0); // RangeError

