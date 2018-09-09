/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//=========== Logical Operation ==========//

// console.log((false && undefined)); // false
// console.log((false || undefined)); // undefined
// console.log(((false && undefined) || (false || undefined)));
// // false || undefined => undefined

// console.log(((false || undefined) || (false && undefined)));
// // undefined || false => false

// console.log(((false && undefined) && (false || undefined)));
// // false && undefined => false

// console.log(((false || undefined) && (false && undefined)));
// // undefined && false => undefined

// console.log(('a' || (false && undefined) || '')); // 'a'
// console.log(((false && undefined) || 'a' || '')); // 'a'
// console.log(('a' && (false || undefined) && ''));
// // 'a' && undefined && '' => undefined

// console.log(((false || undefined) && 'a' && '')); // undefined






/*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
//=========== Conditional Loop ==========//

// var i = 0;
// while (i < 10) {
//   if (i % 3 === 0) {
//     console.log(i);
//   } else {
//     i += 1;
//   }
// }


// nope

// Array(4).fill().forEach((_, i) => console.log(i * 3));









/*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
//=========== Multiplication Table ==========//

// var row;
// var i;
// var j;

// function padLeft(num) {
//   return String(num).length <= 1 ? ' ' + num : num;
// }

// for (i = 1; i <= 10; i++) {
//   row = '';
//   for (j = 1; j <= 10; j++) {
//     row += padLeft(i * j) + ' ';
//   }
//   console.log(row + '\n');
// }


// Array(10).fill().map((_, i) => {
//   return Array(10).fill().map((_, j) => String((i + 1) * ++j).padStart(3)).join(' ');
// }).forEach(row => console.log(row));

// Array(10).fill()
//          .map((_, i) => Array(10).fill().map((_, j) => String((i + 1) * ++j).padStart(3)).join(' '))
//          .forEach(row => console.log(row));










/*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
//=========== Selected Columns ==========//



// function getSelectedColumns(numbers, cols) {
//   var result = [];
//   for (var i = 0, lengthI = numbers.length; i < lengthI; i++) {
//     for (var j = 0, lengthJ = cols.length; j < lengthJ; j++) {
//       if (!result[j]) {
//         result[j] = [];
//       }

//       result[j][i] = numbers[i][cols[j]];
//     }
//   }

//   return result;
// }


// function getSelectedColumns(numbers, cols) {
//   var result = [];
//   for (var i = 0; i < cols.length; i++) {
//     for (var j = 0; j < numbers.length; j++) {
//       result[i] = [];
//       result[i][j] = numbers[j][cols[i]];
//     }
//   }

//   return result;
// }


// function getSelectedColumns(rows, cols) {
//   return cols.map(i => rows.map(row => row[i]));
// }


// // Given array of number arrays
// var array1 = [[1, 2, 3],
//               [4, 5, 6],
//               [7, 8, 9]];

// var array2 = [[1, 2, 3],
//               [1, 2, 3],
//               [1, 2, 3]];

// var array3 = [[1, 2, 3, 4],
//               [1, 2, 3, 4],
//               [1, 2, 3, 4]];

// var array4 = [[1, 2, 3],
//               [1, 2, 3],
//               [1, 2, 3],
//               [4, 5, 6]];

// console.log(getSelectedColumns(array1, [0]));
// // [[1]]; expected [[1, 4, 7]]

// console.log(getSelectedColumns(array1, [0, 2]));
// // [[1, 4], [3, 6]]; expected [[1, 4, 7], [3, 6, 9]]

// console.log(getSelectedColumns(array2, [1, 2]));
// // [[2, 2], [3, 4]]; expected [[2, 2, 2], [3, 3, 3]]

// console.log(getSelectedColumns(array3, [1, 2]));    // [[2, 2, 2], [3, 3, 3]]
// console.log(getSelectedColumns(array3, [1, 2, 3])); // [[2, 2, 2], [3, 3, 3], [4, 4, 4]]
// console.log(getSelectedColumns(array4, [0, 1]));    // [[1, 1, 1, 4], [2, 2, 2, 5]]





/*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
//=========== Counter ==========//

// // Code Snippet 1:
// var counter = 5;
// var rate = 3;
// console.log('The total value is ' + (counter * rate));

// function counter(count) {
//   // ...
// }

// // // eqv to:
// // function counter(count) {};
// // var rate;
// // counter = 5;
// // rate = 3;
// // console.log('The total value is ' + (counter * rate)); // 15





// // Code Snippet 2:
// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + (counter * rate));

// var counter = 5;
// var rate = 3;

// // // eqv to:
// // function counter(count) {};
// // var rate;
// // console.log('The total value is ' + (counter * rate));
// // // function...{} * undefined => NaN
// // counter = 5;
// // rate = 3;



// // Code Snippet 3:
// var counter = 5;
// var rate = 3;

// function counter(count) {
//   // ...
// }

// console.log('The total value is ' + (counter * rate));

// // // eqv to:
// // function counter(count) {};
// // var rate;
// // counter = 5;
// // rate = 3;
// // console.log('The total value is ' + (counter * rate)); // 15






/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//=========== Logger ==========//

// function debugIt() {
//   var status = 'debugging';
//   function logger() {
//     console.log(status);
//   }

//   logger();
// }

// debugIt();

// // an inner scope of a nested function can access variables in any outer scope.








/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//=========== Invoice ==========//

// function invoiceTotal(amount1, amount2, amount3, amount4) {
//   return amount1 + amount2 + amount3 + amount4;
// }

// function invoiceTotal(...amounts) {
//   return amounts.reduce((sum, amount) => sum + amount, 0);
// }

// var invoiceTotal = (...amounts) => amounts.reduce((sum, amount) => sum + amount, 0);

// console.log(invoiceTotal(20, 30, 40, 50));           // works
// console.log(invoiceTotal(20, 30, 40, 50, 40, 40));   // doesn't work; how can you make it work?










/*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
//=========== Product of Sums ==========//

function productOfSums(array1, array2) {
  var result;
  result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  var sum = 0;
  for (var i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }

  return sum;
}


function productOfSums(...arrs) {
  return arrs.reduce((prod, arr) => prod * arr.reduce((sum, n) => sum + n, 0), 1);
}

console.log(productOfSums([1, 2, 3], [4, 5, 6, 10])); // 150
console.log(productOfSums([1, 2, 3], [4, 5, 6]));     // 90
console.log(productOfSums([1, 2, 3], [4, 5]));        // 54
console.log(productOfSums([1, 2, 3], [4]));           // 24
console.log(productOfSums([1, 2, 3], []));            // 0
console.log(productOfSums([1], []));                  // 0
console.log(productOfSums([0], []));                  // 0
console.log(productOfSums([], []));                   // 0
console.log(productOfSums([1, 5], [10], [10], [1, 2, 3, 4]));  // 6000
console.log(productOfSums([1]));                      // 1
console.log(productOfSums([]));                       // 1
