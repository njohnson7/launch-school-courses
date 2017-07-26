var reaction = 'negative';
switch (reaction) {
  case 'positive':
    console.log('+++');
    break;
  case 'negative':
    console.log('---');
    break;
  case 'undecided':
    console.log('???');
    break;
  default:
    console.log('kewl');
}
// '---'

Number('abc'); // NaN
Math.sqrt(-1); // NaN
undefined + 1; // NaN

typeof(NaN); // number

10 === NaN;  // false
10 < NaN;    // false
10 > NaN;    // false
NaN === NaN; // false

var foo = NaN;
isNaN(foo);     // true
isNaN('hello'); // true

function isValueNaN(value) {
  return value !== value;
}

isValueNaN(NaN);       // true
isValueNaN(false);     // false
isValueNaN(null);      // false
isValueNaN(undefined); // false
isValueNaN('');        // false
isValueNaN(0);         // false
isValueNaN(true);      // false

function isValueNaN(value) {
  return typeof value === 'number' && isNaN(value);
}

isValueNaN(NaN);       // true
isValueNaN(false);     // false
isValueNaN(null);      // false
isValueNaN(undefined); // false
isValueNaN('');        // false
isValueNaN(0);         // false
isValueNaN(true);      // false

var x = 1;

x