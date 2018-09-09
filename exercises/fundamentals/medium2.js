/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//========== Defaults ==========//

// function processOrder(price, quantity, discount, serviceCharge, tax) {
//   if (!quantity) {
//     quantity = 1;
//   }

//   if (!discount) {
//     discount = 0;
//   }

//   if (!serviceCharge) {
//     serviceCharge = 0.1;
//   }

//   if (!tax) {
//     tax = 0.15;
//   }

//   return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
// }

// function processOrder(price, quantity, discount, serviceCharge, tax) {
//   quantity = quantity || 1;
//   discount = discount || 0;
//   serviceCharge = serviceCharge || 0.1;
//   tax = tax || 0.15;
//   return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
// }

// function processOrder(price, quantity, discount, serviceCharge, tax) {
//   quantity = quantity || quantity === 0 ? 0 : 1;
//   discount = discount || 0;
//   serviceCharge = serviceCharge || serviceCharge === 0 ? 0 : 0.1;
//   tax = tax || tax === 0 ? 0 : 0.15;
//   return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
// }

// console.log(processOrder(100));      // 126.5
// console.log(processOrder(100, 0));   // 0
// console.log(processOrder());   // 0






/*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
//========== Equal ==========//

// var person =      { name: 'Victor' };
// var otherPerson = { name: 'Victor' };

// console.log(person === otherPerson);  // false; but we want this to be true
// console.log(person == otherPerson);  // false; but we want this to be true
// console.log('========');



// otherPerson = person;
// console.log(person === otherPerson);  // false; but we want this to be true
// console.log('========');



// var person =      { name: 'Victor' };
// var otherPerson = { name: 'Victor' };

// function objEqual(obj1, obj2) {
//   for (var prop in obj1) {
//     if (obj1[prop] !== obj2[prop]) return false;
//   }

//   return true;
// }
// console.log(objEqual(person, otherPerson));
// console.log('========');




// function objEqual(obj1, obj2) {
//   return Object.keys(obj1).every(k => obj1[k] === obj2[k]);
// }

// function objEqual(obj1, obj2) {
//   return Object.keys(obj1).length === Object.keys(obj1).length &&
//     Object.entries(obj1).every(([k, v]) => obj2[k] === v);
// }

// var obj1 = { a: 1, b: 2 };
// var obj2 = { a: 1, b: 2 };
// var obj3 = { a: 1, b: 3 };
// console.log(objEqual(person, otherPerson)); // true
// console.log(objEqual(obj1, obj2));          // true
// console.log(objEqual(obj1, obj3));          // false
// console.log('=======');





/*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
//========== Amount Payable ==========//

// var startingBalance = 1;
// var chicken = 5;
// var chickenQuantity = 7;

// var totalPayable = function(item, quantity) {
//   return startingBalance + (item * quantity);
// }

// startingBalance = 5;
// console.log(totalPayable(chicken, chickenQuantity));
// // 5 + 5 * 7 => 40

// startingBalance = 10;
// console.log(totalPayable(chicken, chickenQuantity));
// // 10 + 5 * 7 => 45

// var startingBalance;
// var chicken;
// var chickenQuantity;
// var totalPayable;
// startingBalance = 1;
// chicken = 5;
// chickenQuantity = 7;

// totalPayable = function(item, quantity) {
//   return startingBalance + (item * quantity);
// }

// startingBalance = 5;
// console.log(totalPayable(chicken, chickenQuantity));

// startingBalance = 10;
// console.log(totalPayable(chicken, chickenQuantity));



// var foo = 1;
// function bar() {
//   return foo;
// }
// console.log(bar()); // 1
// foo = 10;
// console.log(bar()); // 10





/*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
//========== Caller ==========//

// // function doubler(number, caller) {
// //   console.log('This function was called by ' + caller + '.');
// //   return number + number;
// // }

// // doubler(5, 'Victor');       // 10
// // // This function was called by Victor.

// // Can you create a makeDoubler function, which returns a function that's
// //  functionally equivalent to doubler, but with the caller preset?


// function makeDoubler(caller) {
//   return function(number) {
//     console.log(`This function was called by ${caller}.`);
//     return number * 2;
//   }
// }

// var makeDoubler = caller => num => {
//   console.log(`This function was called by ${caller}.`);
//   return num * 2;
// }

// var doubler = makeDoubler('Victor');
// doubler(5);                 // 10
// // This function was called by Victor.

// console.log(doubler(5));




/*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
//========== What's My Value? ==========//

// var arr = ['Apples', 'Peaches', 'Grapes'];

// arr[3.4] = 'Oranges';
// console.log(arr.length); // 3
// console.log(Object.keys(arr).length); // 4

// arr[-2] = 'Watermelon';
// console.log(arr.length); // 3
// console.log(Object.keys(arr).length); // 5

// console.log(Object.keys(arr));
// console.log('----');

// arr = [1, 2];
// arr[4] = 5;
// console.log(arr);
// console.log(arr.length);
// console.log(Object.keys(arr));
// console.log(Object.keys(arr).length);

// a = [,];
// b = Array(1);
// c = new Array(1);
// d = [undefined];
// console.log(a);                     // [undefined × 1]
// console.log(b);                     // [undefined × 1]
// console.log(c);                     // [undefined × 1]
// console.log(d);                     // [undefined]

// console.log(a.length);              // 1
// console.log(d.length);              // 1

// console.log(Object.keys(a).length); // 0
// console.log(Object.keys(d).length); // 1

// console.log(0 in a);                // false
// console.log(0 in d);                // true

// console.log(a[0]);
// // undefined - because the property '0' is not defined

// console.log(d[0]);
// // undefined - because the value at '0' is undefined






/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//========== Length ==========//

// var languages = ['JavaScript', 'Ruby', 'Python'];
// console.log(languages);        // ['JavaScript', 'Ruby', 'Python']
// console.log(languages.length); // 3

// languages.length = 4;
// console.log(languages);        // ['JavaScript', 'Ruby', 'Python', undefined x 1]
// console.log(languages.length); // 4

// languages.length = 1;
// console.log(languages);        // ['JavaScript']
// console.log(languages.length); // 1

// languages.length = 3;
// console.log(languages);        // ['JavaScript', undefined x 2]
// console.log(languages.length); // 3

// languages.length = 1;
// languages[2] = 'Python';
// console.log(languages);        // ['JavaScript', undefined x 1, 'Python']
// console.log(languages[1]);     // undefined
// console.log(languages.length); // 3

// console.log('=======');

// var arr = [1, 2];
// arr.length = 4;
// console.log(arr);   // [1, 2, undefined × 2]

// console.log(arr.indexOf(undefined));    // -1
// console.log(arr.includes(undefined));   // true

// arr[4] = undefined;
// console.log(arr);   // [1, 2, undefined × 2, undefined]
// console.log(arr.indexOf(undefined));    // 4
// console.log(arr.includes(undefined));   // true

// var arr = Array(1);
// console.log(arr);   // [undefined × 1]
// console.log(arr.indexOf(undefined));    // -1
// console.log(arr.includes(undefined));   // true

// var arr = Array(1);
// console.log(arr.indexOf(undefined)); // -1
// arr.push(undefined);
// console.log(arr.indexOf(undefined)); // 1







/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//========== The Red Pill ==========//

function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne() {
    var result = '';
    for (var i = 0; i < arguments.length; i++) {
      result += String.fromCharCode(arguments[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101, 32));
    anotherOne(116, 111, 32);
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101, 32);
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33);


// - one():
//   - invokes: anotherAnotherOne():
//     - logs:    'Welcome '
//     - invokes: anotherOne(116, 111, 32):
//       - invokes: log('to '):
//         - logs:    'to '
//         - returns: undefined
//       - returns: undefined
//     - returns: undefined
//   - invokes: anotherOne(116, 104, 101, 32);
//     - invokes: log('the ')
//       - logs:    'the '
//       - returns: undefined
//     - returns: undefined
//   - returns: anotherOne

// - anotherOne(77, 97, 116, 114, 105, 120, 33);
//   - invokes: log('Matrix!')
//     - logs:    'Matrix!'
//     - returns: undefined
//   - returns: undefined

// - overall results:
//   - logs:
//     - 'Welcome '
//     - 'to '
//     - 'the '
//     - 'Matrix!'
//   - returns: undefined
