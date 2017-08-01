// if
//    BOTH: start and end > 0 && < str.length
//    start < end
//       => str[start...end]   NOT INCLUSIVE
//          ex:    'hello w', 2, 4);    // "ll"
// if start > end, swap values and return above
// if start === end, => ''
// if end === undefined, => str[start..-1]
// if start OR end < 0 || NaN, set it to 0
// if start OR end > str.length, set it to str.length

function substring(str, start, end) {
  var result = '';
  var temp;

  if (end === undefined) end = str.length;
  start = fixIndex(str, start);
  end = fixIndex(str, end);
  if (start > end) {
    temp = end;
    end = start;
    start = temp;
  }

  for (; start < end; start++) {
    result += str[start];
  }

  return result;
}

function fixIndex(str, idx) {
  if (isNaN(idx) || idx < 0) return 0;
  else if (idx > str.length) return str.length;
  else return idx;
}

var string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"
