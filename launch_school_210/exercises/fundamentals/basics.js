/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//===== Building Strings: =====//

var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

// console.log(paragraph);

// This will output a single string, containing no newline characters, but spaces of about
// 14 chars in length following each escaped newline (\)

// There are no bugs/errors.




/*---------------- 2 -----------------*/console.log('\n\n-------- 2 ---------');
//===== Truthy Falsey: =====//

var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {        // true
  console.log('Hello'); // 'Hello'
}

if (!myString) {        // false
  console.log('World'); // ...
}

if (!!myArray) {        // true
  console.log('World'); // 'World'
}

if (myOtherString || myArray) { // falsy || []  --->  truthy
  console.log('!');             // '!'
}








/*---------------- 3 -----------------*/console.log('\n\n-------- 3 ---------');
//===== Conditional: =====//

// if (condition1) {
//   // some code
//   if (condition2) {
//     // some code
//   } else {
//     // some code
//   }
// } else {
//   // some code
//   if (condition4) {
//     // some code
//     if (condition5) {
//     // some code
//     }
//   }
// }


// 1 > 2
// 1 > 3
// else
// else > 4
// else > 4 > 5

// 5 possible flows/paths







/*---------------- 4 -----------------*/console.log('\n\n-------- 4 ---------');
//===== String Assignment: =====//

var name = 'Bob';
var saveName = name; // 'Bob'
name = 'Alice';
console.log(name, saveName); // 'Alice Bob'

var name = 'Bob';
var saveName = name; // 'Bob'
name.toUpperCase();  // return a new string, 'BOB'
console.log(name, saveName); // 'Bob Bob'


// FE:
// b/c string primitives are automatically converted to Objects when methods are called on them





/*---------------- 5 -----------------*/console.log('\n\n-------- 5 ---------');
//===== Arithmetic Integer: =====//



// Enter the first number: 23
// Enter the second number: 17

// 23 + 17 = 40
// 23 - 17 = 6
// 23 * 17 = 391
// 23 / 17 = 1
// 23 % 17 = 6
// 23 ** 17 = 1.4105003956066297e+23


// var number1 = Number(prompt('Enter the first number:'));
// var number2 = Number(prompt('Enter the second number:'));

// console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
// console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
// console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
// console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
// console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
// console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));






/*---------------- 6 -----------------*/console.log('\n\n-------- 6 ---------');
//===== Counting the Number of Characters: =====//

// var phrase = prompt('Please write a phrase:');
// console.log('There are ' + String(phrase.length) + ' characters in "' + phrase + '".');
// console.log(`There are ${phrase.length} characters in "${phrase}".`);


// // FE - no spaces:
// var phrase = prompt('Please write a phrase:');
// var numChars = phrase.replace(/ /g, '').length;
// console.log(`There are ${numChars} characters in "${phrase}".`);


// // FE - alpha only:
// var phrase = prompt('Please write a phrase:');
// var numChars = phrase.replace(/[^a-z]/gi, '').length;
// console.log(`There are ${numChars} characters in "${phrase}".`);



// Please write a phrase: walk
// // console output
// There are 4 characters in "walk".

// Please write a phrase: walk, don't run
// // console output
// There are 15 characters in "walk, don't run".








/*---------------- 7 -----------------*/console.log('\n\n-------- 7 ---------');
//===== Convert String to a Number: =====//

function stringToInteger(strNum) {
  var NUMS = { 0: 0, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9 };
  var result = 0;
  var value;
  var digit;
  var len = strNum.length;

  for (var i = 0; i < len; i++) {
    digit = NUMS[strNum[len - (i + 1)]];
    value = digit * 10**i;
    result += value;
  }

  return result;
}


function stringToInteger(strNum) {
  var NUMS = { 0: 0, 1: 1, 2: 2, 3: 3, 4: 4, 5: 5, 6: 6, 7: 7, 8: 8, 9: 9 };
  var reversedDigits = strNum.split('').reverse();

  result = reversedDigits.reduce(function(sum, digit, i) {
    return sum + NUMS[digit] * 10**i;
  }, 0);

  return result;
}


function stringToInteger(strNum) {
  var NUMS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var reversedDigits = strNum.split('').reverse();
  return reversedDigits.reduce((sum, digit, i) => sum + NUMS[digit] * 10**i, 0);
}

var NUMS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
function stringToInteger(num) {
  return num.split('').reverse().reduce((sum, n, i) => sum + NUMS[n] * 10**i, 0);
}


var NUMS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
function stringToInteger(num) {
  return num.split('').reverse().reduce((sum, n, i) => sum + NUMS[n] * 10**i, 0);
}


var DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
function stringToInteger(str) {
  return str.split('').reduce((sum, n) => 10 * sum + DIGITS[n], 0);
}


console.log(stringToInteger('4321'));          // 4321
console.log(stringToInteger('570'));           // 570





/*---------------- 8 -----------------*/console.log('\n\n-------- 8 ---------');
//===== Convert String to a Signed Number: =====//

var DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function stringToSignedInteger(str) {
  var sign = 1;

  if (/^[-+]/.test(str)) {
    if (str[0] === '-') sign = -1;
    str = str.slice(1);
  }

  return sign * str.split('').reduce((sum, n) => 10 * sum + DIGITS[n], 0);
}


function stringToSignedInteger(str) {
  switch (str[0]) {
    case '-': return -stringToInteger(str.slice(1));
    case '+': return stringToInteger(str.slice(1));
    default:  return stringToInteger(str);
  }
}


function stringToSignedInteger(str) {
  var num = stringToInteger(str.replace(/^[-+]/, ''));
  return RegExp.lastMatch === '-' ? -num : num;
}


function stringToSignedInteger(str) {
  return stringToInteger(str.replace(/^[-+]/, '')) * (str[0] === '-' ? -1 : 1);
}

function stringToSignedInteger(str) {
  return stringToInteger(str.replace(/^[-+]/, '')) * (RegExp.lastMatch === '-' ? -1 : 1);
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100






/*---------------- 9 -----------------*/console.log('\n\n-------- 9 ---------');
//===== Convert a Number to a String: =====//

var DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(num) {
  var result = '';

  do {
    result = DIGITS[num % 10] + result;
    num = Math.floor(num / 10);
  } while (num > 0);

  return result;
}


function integerToString(num, result = '') {
  if (num < 10) return DIGITS[num % 10] + result;
  return integerToString(Math.floor(num / 10), DIGITS[num % 10] + result);
}


function integerToString(num, result = '') {
  result = DIGITS[num % 10] + result;
  return (num < 10 ? result : integerToString(Math.floor(num / 10), result));
}


function integerToString(num, result = '') {
  result = '0123456789'[num % 10] + result;
  return (num < 10 ? result : integerToString(Math.floor(num / 10), result));
}




console.log(integerToString(4321));    // "4321"
console.log(integerToString(0));       // "0"
console.log(integerToString(5000));    // "5000"
console.log(integerToString(50200123));





/*---------------- 10 -----------------*/console.log('\n\n-------- 10--------');
//===== Convert a Signed Number to a String: =====//

SIGNS = { '-1': '-', 0: '', 1: '+' };

function signedIntegerToString(num) {
  return SIGNS[Math.sign(num)] + integerToString(Math.abs(num));
}



console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
