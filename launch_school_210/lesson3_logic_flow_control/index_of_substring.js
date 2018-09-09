function indexOf(str, sub) {
  var str_len = str.length;
  var sub_len = sub.length;
  var current;

  for (var i = 0; i <= str_len - sub_len; i++) {
    current = '';
    for (var j = 0; j < sub_len; j++) {
      current += str[i + j];
    }

    if (current === sub) return i;
  }

  return -1;
}

function lastIndexOf(str, sub) {
  var str_len = str.length;
  var sub_len = sub.length;
  var current;

  for (var i = str_len - 1; i >= sub_len - 1; i--) {
    current = '';
    for (var j = sub_len - 1; j >= 0; j--) {
      current += str[i - j];
    }

    if (current === sub) return i - sub_len + 1;
  }

  return -1;
}


// FE:
function lastIndexOf(str, sub) {
  var strReversed = reverseStr(str);
  var subReversed = reverseStr(sub);
  var idx = indexOf(strReversed, subReversed);
  return idx === -1 ? -1 : str.length - sub.length - idx;
}

function reverseStr(str) {
  for (var i = str.length - 1, reversed = ''; i >= 0; i--) {
    reversed += str[i];
  }

  return reversed;
}

console.log(indexOf('Some strings', 's'));      // 5
console.log(indexOf('Blue Whale', 'Whale'));    // 5
console.log(indexOf('Blue Whale', 'Blute'));    // -1
console.log(indexOf('Blue Whale', 'leB'));      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
