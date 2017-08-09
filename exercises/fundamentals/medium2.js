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

function doubler(number, caller) {
  console.log('This function was called by ' + caller + '.');
  return number + number;
}

doubler(5, 'Victor');       // 10
// This function was called by Victor.

function doubler(number, caller) {
  console.log('This function was called by ' + caller + '.');
  return number + number;
}

doubler(5, 'Victor');       // 10
// This function was called by Victor.








/*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
//========== What's My Value? ==========//










/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//========== Length ==========//










/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//========== The Red Pill ==========//






