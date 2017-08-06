/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
//======= Array Copy 1 =======//

// var myArray = [1, 2, 3, 4];
// var myOtherArray = myArray;

// myArray.pop();  // mutates the array that both vars point to
// console.log(myOtherArray);  // [1, 2, 3]

// myArray = [1, 2]; // reassigns to new array
// console.log(myOtherArray);  // [1, 2, 3], still points to original array







/*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
//======= Array Copy 2 =======//

// var myArray = [1, 2, 3, 4];
// var myOtherArray = myArray;

// myArray.pop();
// console.log(myOtherArray);


// myArray = [1, 2];
// console.log(myOtherArray);



// var arr3 = myArray.slice();
// console.log(arr3); // [1, 2]
// console.log(arr3 === myArray); // false

// var arr4 = Array.from(myArray);
// console.log(arr4); // [1, 2]
// console.log(arr4 === myArray); // false

// var arr5 = myArray.map(elem => elem);
// console.log(arr5); // [1, 2]
// console.log(arr5 === myArray); // false






/*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
//======= Array Concat =======//

// // first arg => always array
// // return: new array (shallow copy)
// // follow the order of passing of the array args...?

// function concat(arr, value) {
//   newArr = arr.slice();

//   if (!Array.isArray(value)) {
//     newArr.push(value);
//   } else {
//     value.forEach(elem => newArr.push(elem));
//   }

//   return newArr;
// }



// function concat(arr, value) {
//   result = arr.slice();
//   Array.isArray(value) ? value.forEach(elem => result.push(elem)) : result.push(value);
//   return result;
// }



// function concat(arr, value) {
//   if (!Array.isArray(value)) value = [value];
//   result = arr.slice();
//   value.forEach(elem => result.push(elem));
//   return result;
// }



// function concat(arr1, value) {
//   var arr2 = Array.isArray(value) ? value : [value];
//   return arr2.reduce((result, elem) => result.push(elem) && result, arr1.slice());
// }


// function concat(arr, value) {
//   return Array.isArray(value) ? [...arr, ...value] : [...arr, value];
// }




// console.log(concat([1, 2, 3], [4, 5, 6]));            // [1, 2, 3, 4, 5, 6]
// console.log(concat([1, 2], 3));                       // [1, 2, 3]
// console.log(concat([2, 3], ['two', 'three']));        // [2, 3, "two", "three"]
// console.log(concat([2, 3], 'four'));                  // [2, 3, "four"]


// var obj = { a: 2, b: 3 };
// var newArray = concat([2, 3], obj);
// console.log(newArray);                                // [2, 3, { a: 2, b: 3 }]
// console.log(newArray[2]);                             // { a: 2, b: 3 }]
// obj.a = 'two';
// console.log(newArray);                                // [2, 3, { a: 'two', b: 3 }]
// console.log(newArray[2]);                             // { a: 'two', b: 3 }]

// var arr1 = [1, 2, 3];
// var arr2 = [4, 5, obj];
// var arr3 = concat(arr1, arr2);
// console.log(arr3);                                    // [1, 2, 3, 4, 5, { a: 'two', b: 3 }]
// console.log(arr3[5]);                                 // { a: 'two', b: 3 }]
// obj.b = 'three';
// console.log(arr3);                                    // [1, 2, 3, 4, 5, { a: 'two', b: 'three' }]
// console.log(arr3[5]);                                 // { a: 'two', b: 'three' }]

// console.log(arr3[5].b = 3);                           // or arr3[5]['b'] = 3
// console.log(obj);                                     // { a: 'two', b: 3 }







/*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
//======= Array Concat 2 =======//

// function concat() {
//   args = Array.from(arguments);
//   return args.reduce((result, arr) => {
//     if (!Array.isArray(arr)) arr = [arr];
//     arr.forEach(elem => result.push(elem));
//     return result;
//   }, []);
// }



// function concat(...args) {
//   return args.reduce((result, arg) => {
//     if (!Array.isArray(arg)) arg = [arg];
//     arg.forEach(elem => result.push(elem));
//     return result;
//   }, []);
// }



// function concat(...args) {
//   var arrays = args.map(arg => Array.isArray(arg) ? arg : [arg]);
//   return arrays.reduce((result, arr) => {
//     arr.forEach(elem => result.push(elem));
//     return result;
//   }, []);
// }



// function concat(...args) {
//   var arrays = args.map(elem => Array.isArray(elem) ? elem : [elem]);
//   return arrays.reduce((result, arr) => arr.forEach(elem => result.push(elem)) || result, []);
// }



// function concat(...args) {
//   return args.map(elem => Array.isArray(elem) ? elem : [elem])
//     .reduce((result, arr) => arr.forEach(elem => result.push(elem)) || result, []);
// }


// console.log(concat([1, 2 ,3], [4, 5, 6], [7, 8, 9]));  // [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
// console.log(concat([1, 2], "a", ["one", "two"]));      // [ 1, 2, "a", "one", "two" ]
// console.log(concat([1, 2], ["three"], 4));             // [ 1, 2, "three", 4 ]








/*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
//======= Array Pop and Push =======//


// function pop(arr) {
//   return arr.splice(-1)[0];
// }

// function push(arr, ...values) {
//   values.forEach(value => arr[arr.length] = value);
//   return arr.length;
// }
// function push(arr, ...values) {
//   values.forEach(value => arr.splice(100, 0, value));
//   return arr.length;
// }
// // function push(arr, ...values) {
// //   return (values[0] ? arr.splice(arr.length, 0, values[0]) && push(arr, values.slice(1)) : arr);
// // }
// // function push(arr, ...values) {
// //   return (values.length ? arr.splice(arr.length, 0, values[0]) && push(arr, values.slice(1)) : arr);
// // }



// // // buggy versions (fixed):
// // function pop(array) {
// //   var poppedElement = array[array.length - 1];
// //   array.splice(array.length - 1);
// //   return poppedElement;
// // }
// // function push(array) {
// //   for (var i = 1; i < arguments.length; i++) {
// //     array[array.length] = arguments[i];
// //   }

// //   return array.length;
// // }



// // FE:
// function pop(arr) {
//   var lastElem = arr[arr.length - 1];
//   arr.length = Math.max(0, arr.length - 1);
//   return lastElem;
// }
// function pop(arr) {
//   var lastElem = arr.slice(-1)[0];
//   arr.length = Math.max(0, arr.length - 1);
//   return lastElem;
// }


// var array = [1, 2, 3];
// console.log(pop(array));                   // 3
// console.log(array);                        // [1, 2]
// console.log(pop([]));                      // undefined
// console.log(pop([1, 2, ['a', 'b', 'c']])); // [ 'a', 'b', 'c' ]

// var array = [1, 2, 3];
// console.log(push(array, 4, 5, 6));         // 6
// console.log(array);                        // [1, 2, 3, 4, 5, 6]
// console.log(push([1, 2], ['a', 'b']));     // 3
// console.log(push([], 1));                  // 1
// console.log(push([]));                     // 0






/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//======= Array and String Reverse =======//

// function reverse(arg) {
//   var result;

//   for (var i = 0; i < arg.length; i++) {
//     if (Array.isArray(arg)) {
//       result = result || [];
//       result.unshift(arg[i]);
//     } else {
//       result = result || '';
//       result = arg[i] + result;
//     }
//   }

//   return result;
// }


// function reverse(arg) {
//   var result = [];
//   for (var i = 0; i < arg.length; i++) {
//     result.unshift(arg[i]);
//   }

//   return Array.isArray(arg) ? result : result.join('');
// }


// function reverse(arg) {
//   var result = [...Array(arg.length).keys()].reduce((res, i) => [].concat(arg[i], res), []);
//   return Array.isArray(arg) ? result : result.join('');
// }


// function reverse(arg) {
//   var result = [...Array(arg.length).keys()].map(i => arg[arg.length - i - 1]);
//   return Array.isArray(arg) ? result : result.join('');
// }


// function reverse(arg) {
//   var result = [...Array(arg.length).keys()].reduce((res, i) => [arg[i], ...res], []);
//   return Array.isArray(arg) ? result : result.join('');
// }


// function reverse(arg) {
//   var result = Array.from({length: arg.length}, (_, i) => arg[arg.length - i - 1]);
//   return Array.isArray(arg) ? result : result.join('');
// }

// function reverse(arg) {
//   var result = Array(arg.length).fill().map((_, i) => arg[arg.length - ++i])
//   return Array.isArray(arg) ? result : result.join('');
// }




// // // Buggy solution (fixed):
// // function reverse(inputForReversal) {
// //   if (Array.isArray(inputForReversal)) {
// //     return reverseArray(inputForReversal);
// //   } else {
// //     return reverseString(inputForReversal);
// //   }
// // }
// // function reverseArray(inputForReversal) {
// //   var reversed = [];
// //   for (var i = 0, length = inputForReversal.length; i < length; i++) {
// //     reversed[length - i - 1] = inputForReversal[i];
// //   }

// //   return reversed;
// // }
// // function reverseString(inputForReversal) {
// //   var stringArray = inputForReversal.split('');
// //   return reverseArray(stringArray).join('');
// // }



// console.log(reverse('Hello'));          // olleH
// console.log(reverse('a'));              // a
// console.log(reverse([1, 2, 3, 4]));     // [4, 3, 2, 1]
// console.log(reverse([]));               // []







/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//======= Array Shift and Unshift =======//

// shift:   remove first elem and return it, or undefined if arr.empty?
// unshift: adds 1+ elems to start of array, return new length


// function shift(arr) {
//   var shiftedElem = arr[0];

//   for (var i = 1; i < arr.length; i++) {
//     arr[i - 1] = arr[i];
//   }

//   arr.length = Math.max(0, arr.length - 1);
//   return shiftedElem;
// }
// function shift(arr) {
//   var shiftedElem = arr.reverse().pop();
//   arr.reverse();
//   return shiftedElem;
// }
// function shift(arr) {
//   return arr.splice(0, 1)[0];
// }
// // const shift = arr => arr.splice(0, 1)[0];

// function unshift(arr, ...values) {
//   var lastIdx = arr.length + values.length - 1;
//   var currentElem;

//   for (var i = lastIdx; i >= 0; i--) {
//     currentElem = arr[i - values.length] || values[i];
//     arr[i] = currentElem;
//   }

//   return arr.length;
// }
// function unshift(arr, ...values) {
//   for (var i = arr.length + values.length - 1; i >= 0; i--) {
//     arr[i] = arr[i - values.length] || values[i];
//   }

//   return arr.length;
// }
// function unshift(arr, ...values) {
//   Array.prototype.push.apply(arr.reverse(), [...values.reverse()]);
//   return arr.reverse().length;
// }
// function unshift(arr, ...values) {
//   Array.prototype.splice.apply(arr, [0, 0, ...values]);
//   return arr.length;
// }


// console.log(shift([1, 2, 3]));                // 1
// console.log(shift([]));                       // undefined
// console.log(shift( [[1, 2, 3], 4, 5] ));      // [1, 2, 3]


// var arr = [1, 2, 3];
// console.log(unshift([1, 2, 3], 5, 6));        // 5
// console.log(unshift(arr, 5, 6));              // 5
// console.log(arr);                             // [5, 6, 1, 2, 3]

// var arr = [1, 2, 3];
// console.log(unshift([1, 2, 3]));              // 3
// console.log(unshift(arr));                    // 3
// console.log(arr);                             // [1, 2, 3]

// var arr = [4, 5];
// console.log(unshift([4, 5], [1, 2 ,3]));      // 3
// console.log(unshift(arr, [1, 2 ,3]));         // 3
// console.log(arr);                             // [ [1, 2, 3], 4, 5 ]


// var testArray = [1, 2, 3];
// console.log(shift(testArray));                // 1
// console.log(testArray);                       // [2, 3]
// console.log(unshift(testArray, 5));           // 3
// console.log(testArray);                       // [5, 2, 3]







/*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
//======= Array Slice and Splice =======//


// // begin, end: >= 0
// // if begin/end > arr.length, then set to arr.length
// // return: new array => arr(begin...end)
// // don't mutate

// function slice(arr, begin, end) {
//   var result = [];

//   end = Math.min(end, arr.length);
//   begin = Math.min(begin, end);

//   for (var i = begin; i < end; i++) {
//     result.push(arr[i])
//   }

//   return result;
// }
// function slice(arr, begin, end) {
//   end = Math.min(end, arr.length);
//   begin = Math.min(begin, end);
//   return Array(end - begin).fill().map((_, i) => arr[i + begin]);
// }


// // console.log(slice([1, 2, 3], 1, 2));           // [2]
// // console.log(slice([1, 2, 3], 2, 0));           // []
// // console.log(slice([1, 2, 3], 5, 1));           // []

// // var arr = [1, 2, 3];
// // console.log(slice(arr, 1, 3));                 // [2, 3]
// // console.log(arr);                              // [1, 2, 3]
// // console.log('=========');





// // start, del >= 0
// // if start > arr.length, set to arr.length
// // if del > arr.length - start, set to arr.length - start

// // function splice(arr, start, deleteCount[, item1[, itemN]]) {


// // function splice(arr, start, del, ...items) {
// //   var removed = [];
// //   start = Math.min(start, arr.length);
// //   del = Math.min(del, arr.length - start);
// //   var add = items.length;
// //   var newLen = arr.length - del + add;


// //   for (var i = start; i < start + del; i++) {
// //     removed.push(arr[i]);
// //     arr[i] = items.pop() || arr[i + del];
// //   }

// //   items.forEach(item => {
// //     for (var j = newLen - 1; j >= start; j--) {
// //       debugger;
// //       arr[j] = arr[j - 1] || item;
// //     }
// //   });

// //   arr.length = newLen;
// //   return removed;
// // }


// function splice(arr, start, deleteCount, ...items) {
//   start = Math.min(start, arr.length);
//   deleteCount = Math.min(deleteCount, arr.length - start);

//   var removed = remove(arr, start, deleteCount);
//   insert(arr, start, items);

//   return removed;
// }

// function remove(arr, start, deleteCount) {
//   var removed = [];

//   for (var i = start; i < start + deleteCount; i++) {
//     removed.push(arr[i]);
//     arr[i] = arr[i + deleteCount];
//   }

//   arr.length = arr.length - deleteCount;
//   return removed;
// }

// function insert(arr, start, items) {
//   var addCount = items.length;
//   var lastIdx = arr.length + addCount - 1;

//   for (var i = 0; i < arr.length - start; i++) {
//     arr[lastIdx - i] = arr[lastIdx - i - addCount];
//   }

//   for (var i = 0; i < addCount; i++) {
//     arr[start + i] = items[i];
//   }
// }

// function splice(arr, start, del, ...items) {
//   start = Math.min(start, arr.length);
//   del = Math.min(del, arr.length - start);
//   var removed = [];

//   for (var i = start; i < arr.length; i++) {
//     i < start + del ? removed.push(arr[i]) : items.push(arr[i]);
//   }

//   arr.length = start;

//   for (var i = 0; i < items.length; i++) {
//     arr.push(items[i]);
//   }

//   return removed;
// }

// function splice(arr, start, deleteCount, ...items) {
//   start = Math.min(start, arr.length);
//   deleteCount = Math.min(deleteCount, arr.length - start);

//   for (var i = start, removed = []; i < arr.length; i++) {
//     i < start + deleteCount ? removed.push(arr[i]) : items.push(arr[i]);
//   }

//   arr.length = start;
//   items.forEach(item => arr.push(item));
//   return removed;
// }


// console.log(splice([1, 2, 3], 1, 2));                   // [2, 3]
// console.log(splice([1, 2, 3], 1, 3));                   // [2, 3]
// console.log(splice([1, 2, 3], 1, 0));                   // []
// console.log(splice([1, 2, 3], 0, 1));                   // [1]
// console.log(splice([1, 2, 3], 1, 0, 'a'));              // []
// console.log('~~~~~~~~`');

// var arr = [1, 2, 3];
// console.log(splice(arr, 1, 1, 'two'));                  // [2]
// console.log(arr);                                       // [1, 'two', 3];
// console.log('~~~~~~~~`');

// var arr = [1, 2, 3];
// console.log(splice(arr, 1, 2, 'two', 'three'));         // [2, 3]
// console.log(arr);                                       // [1, "two", "three"]
// console.log('~~~~~~~~`');

// var arr = [1, 2, 3];
// console.log(splice(arr, 1, 0));                         // []
// console.log(splice(arr, 1, 0, 'a'));                    // []
// console.log(arr);                                       // [1, 'a', 2, 3]
// console.log('~~~~~~~~`');

// var arr = [1, 2, 3];
// console.log(splice(arr, 0, 0, 'a'));                    // []
// console.log(arr);                                       // ['a', 1, 2, 3]

// // console.log('*********');

// // var arr = [1, 2, 3];
// // console.log(splice(arr, 1, 0)); // []
// // console.log(arr);               // [1, 2, 3]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 1, 4)); // [2, 3, 4, 5]
// // console.log(arr);               // [1, 6, 7]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 6, 6)); // [7]
// // console.log(arr);               // [1, 2, 3, 4, 5, 6]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 12, 2)); // []
// // console.log(arr);                // [1, 2, 3, 4, 5, 6, 7]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 1, 10)); // [2, 3, 4, 5, 6, 7]
// // console.log(arr);                // [1]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 2, 5)); // [3, 4, 5, 6, 7]
// // console.log(arr);               // [1, 2]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 2, 4)); // [3, 4, 5, 6]
// // console.log(arr);               // [1, 2, 7]
// // console.log('~~~~');

// // var arr = [1, 2, 3, 4, 5, 6, 7];
// // console.log(splice(arr, 2, 3)); // [3, 4, 5]
// // console.log(arr);               // [1, 2, 6, 7]
// // console.log('~~~~');





/*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
//======= Oddities =======//

// function oddities(array) {
//   var oddElements = [];
//   for (var i = 0; i < array.length; i += 2) {
//     oddElements.push(array[i]);
//   }
//   return oddElements;
// }

// oddities([2, 3, 4, 5, 6]) === [2, 4, 6];   // false
// oddities(['abc', 'def']) === ['def'];      // false



// they return false because oddities returns a new array, and the strict equality operator only returns true if both of its operands are the same array, when comparing arrays.






/*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
//======= Array Comparison =======//

function areArraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) return false;

  arr1.sort();
  arr2.sort();

  for (var i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) return false;
  }

  return true;
}


function areArraysEqual(arr1, arr2) {
  return arr1.length === arr2.length &&
    arr1.slice().sort().every((elem, i) => elem === arr2.slice().sort()[i]);
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));              // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));              // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));  // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));        // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));        // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));        // false
console.log(areArraysEqual([1, 1, 2], [1, 1, 2, 4]));           // false
console.log(areArraysEqual([1, 2, 2], [1, 1, 2]));              // false
console.log('======');

var a = [2, 3, 1];
var b = [3, 1, 2];
console.log(areArraysEqual(a, b));  // true
console.log(a);  // [2, 3, 1]
console.log(b);  // [3, 1, 2]
