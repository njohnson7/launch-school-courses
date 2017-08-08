/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//========== Literal ===========//

// var myObject = {
//   a:   'name',
//   'b': 'test',
//   123: 'c',
//   1:   'd'
// };
// console.log(myObject[1]);
// console.log(myObject[a]);
// console.log(myObject.a);



// the a in square bracket notation is not wrapped in quotes, so it will be evaluated as a variable, and since a variable called a is not declared anywhere, this will raise a ReferenceError.





/*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
//========== Literal Method ===========//

// var person = {
//   firstName: function() {
//     return 'Victor';
//   },
//   lastName: function() {
//     return 'Reyes';
//   },
// };

// console.log(person.firstName + ' ' + person.lastName);



// the literal contents of the function declaration wil be logged, separated by a space.
// b/c parens need to be appended to a function in order to actually invoke it to evaluate its return value.






/*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
//========== Mutation ===========//

// var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
// var array2 = [];

// for (var i = 0; i < array1.length; i++) {
//   array2.push(array1[i]);
// }

// for (var i = 0; i < array1.length; i++) {
//   if (array1[i].startsWith('C')) {
//     array1[i] = array1[i].toUpperCase();
//   }
// }

// console.log(array2); // original array1 values



// // b/c strings are primitive, and these arrays are two different arrays, so reassigning an element of one will not affect the other.


// // FE:

// // yes, if an object literal was one of the elements, any methods that mutated it in either array would affect that object in both arrays, since both elements are referencing the same object.

// // now any change made to array1 will be reflected to array2:
// var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
// var array2 = array1;

// for (var i = 0; i < array1.length; i++) {
//   if (array1[i].startsWith('C')) {
//     array1[i] = array1[i].toUpperCase();
//   }
// }

// console.log(array2);






/*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
//========== Dynamic ===========//

// var myObject = {
//   prop1:    '123',
//   prop2:    '234',
//   'prop 3': '345',
// };

// var prop2 = '456';
// myObject['prop2'] = '456';
// myObject[prop2] = '678';

// // var myObject = {
// //   prop1:    '123',
// //   prop2:    '456',
// //   'prop 3': '345',
// //   456:      '678',
// // };

// console.log(myObject[prop2]); // '678'
// console.log(myObject.prop2);  // '456'


// // FE:

// var myObj = {};
// myObj[myFunc()] = 'hello, ';
// function myFunc() {
//   return 'funcProp';
// }

// console.log(myObj);
// myObj[myFunc()] = 'world!';
// console.log(myObj);

// // hoisting equivalent:
// var myObj;

// function myFunc() {
//   return 'funcProp';
// }

// myObj = {};
// myObj[myFunc()] = 'hello, ';  // eqv to: myObj['funcProp'] = 'hello, ';
// // myObj === { funcProp: 'hello, ' }

// console.log(myObj);  // { funcProp: 'hello, ' }
// myObj[myFunc()] = 'world!';  // eqv to: myObj.funcProp = 'world!';
// console.log(myObj);  // { funcProp: 'world!' }







/*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
//========== Array Object 1 ===========//

// var myArray = ['a', 'b', 'c'];
// console.log(myArray[0]);   // 'a'
// console.log(myArray[-1]);  // undefined
// myArray[-1] = 'd';
// myArray['e'] = 5;
// myArray[3] = 'f';

// console.log(myArray[-1]);  // 'd'
// console.log(myArray['e']); // 5
// console.log(myArray);
// // ['a', 'b', 'c', 'f', -1: 'd', e: 5]







/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//========== Array Object 2 ===========//

// var myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5;
// function average(array) {
//   var sum = 0;
//   for (var i = -2; i < array.length; i++) {
//     sum += array[i];
//   }

//   return sum / array.length;
// }

// console.log(average(myArray));



// // FE:
// var myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5;
// function average2(array) {
//   var sum = 0;
//   for (var i = -2; i < array.length; i++) {
//     sum += array[i];
//   }

//   return sum / Object.keys(array).length;
// }

// console.log(average2(myArray));


// // alt:
// var myArray = [5, 5];
// myArray[-1] = 5;
// myArray[-2] = 5;
// function average(arr) {
//   return Object.values(arr).reduce((sum, n, _, a) => sum + n / a.length, 0);
// }


// console.log(average(myArray));
// console.log(average([1, 2, 3]));
// myArray['a'] = 20;
// console.log(average(myArray));





/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//========== What's my Bonus ===========//

// function calculateBonus() {
//   return arguments[1] ? arguments[0] / 2 : 0;
// }

// console.log(calculateBonus(2800, true));      // 1400
// console.log(calculateBonus(1000, false));     // 0
// console.log(calculateBonus(50000, true));     // 25000







/*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
//========== The End is Near But Not Here ===========//

// // function penultimate(string) {
// //   return string.split(' ')[-2];
// // }


// // function penultimate(string) {
// //   var words = string.split(' ');
// //   return words[words.length - 2];
// // }

// // function penultimate(string) {
// //   return string.match(/\S+(?= \S+$)/)[0];
// // }

// const penultimate = str => str.match(/\S+(?= \S+$)/)[0];



// console.log(penultimate('last word'));               // 'last'
// console.log(penultimate('Launch School is great!')); // 'is'







/*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
//========== After Midnight Part 1 ===========//


// // Note: Disregard Daylight Savings and Standard Time and other complications.

// var MINUTES_PER_HOUR = 60;
// var HOURS_PER_DAY = 24;
// var MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

// function timeOfDay(deltaMinutes) {
//   var hours;
//   var minutes;

//   deltaMinutes = deltaMinutes % MINUTES_PER_DAY;
//   if (deltaMinutes < 0) {
//     deltaMinutes = MINUTES_PER_DAY + deltaMinutes;
//   }

//   hours = Math.floor(deltaMinutes / MINUTES_PER_HOUR);
//   minutes = deltaMinutes % MINUTES_PER_HOUR;

//   return padWithZeroes(hours, 2) + ':' + padWithZeroes(minutes, 2);
// }

// function padWithZeroes(number, length) {
//   var numberString = String(number);

//   while (numberString.length < length) {
//     numberString = '0' + numberString;
//   }

//   return numberString;
// }

// function timeOfDay(mins) {
//   return new Date(mins * 60000).toUTCString().match(/..:../)[0];
// }

// var timeOfDay = mins => new Date(mins * 60000).toUTCString().match(/..:../)[0];

// console.log(timeOfDay(0));       // "00:00"
// console.log(timeOfDay(-3));      // "23:57"
// console.log(timeOfDay(35));      // "00:35"
// console.log(timeOfDay(-1437));   // "00:03"
// console.log(timeOfDay(3000));    // "02:00"
// console.log(timeOfDay(800));     // "13:20"
// console.log(timeOfDay(-4231));   // "01:29"







/*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
//========== After Midnight Part 2 ===========//



// Note: Disregard Daylight Savings and Standard Time and other irregularities.

var MINUTES_PER_HOUR = 60;
var HOURS_PER_DAY = 24;
var MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

function afterMidnight(timeStr) {
  var timeComponents = timeStr.split(':');
  var hours = parseInt(timeComponents[0]);
  var minutes = parseInt(timeComponents[1]);

  return hours * MINUTES_PER_HOUR + minutes;
}

function beforeMidnight(timeStr) {
  var deltaMinutes = MINUTES_PER_DAY - afterMidnight(timeStr);
  if (deltaMinutes === MINUTES_PER_DAY) {
    deltaMinutes = 0;
  }
  return deltaMinutes;
}

function afterMidnight(str) {
  return Math.abs((new Date('1970-01-01T00:00') - new Date(`1970-01-01T${str}`)) / 60000);
}

function beforeMidnight(str) {
  return (1440 - afterMidnight(str)) % 1440;
}

console.log(afterMidnight('00:00'));        // 0
console.log(beforeMidnight('00:00'));       // 0
console.log(afterMidnight('12:34'));        // 754
console.log(beforeMidnight('12:34'));       // 686
