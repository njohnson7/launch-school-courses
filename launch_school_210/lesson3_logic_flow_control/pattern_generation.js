function generatePattern(n) {
  for (var i = 1, numStr = ''; i <= n; i++) {
    numStr += String(i);
    stars = generateStars(n - i);
    console.log(numStr + stars);
  }
}

function generateStars(n) {
  for (var i = 0, str = ''; i < n; i++) {
    str += '*'
  }

  return str;
}


// FE:
function generatePattern(n) {
  for (var i = 1, str = ''; i <= n; i++) {
    str += i;
  }

  var len = str.length;
  for (var i = 1, s = ''; i <= n; i++) {
    s += i;
    stars = generateStars(len - s.length)
    console.log(s + stars);
  }
}

generatePattern(7);
generatePattern(3);
generatePattern(20);

// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567
