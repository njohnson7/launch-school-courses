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




var array = [1, 2, 3];
pop(array);                   // 3
console.log(array);           // [1, 2]
pop([]);                      // undefined
pop([1, 2, ['a', 'b', 'c']]); // [ 'a', 'b', 'c' ]

var array = [1, 2, 3];
push(array, 4, 5, 6);         // 6
console.log(array);           // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);     // 3
push([], 1);                  // 1
push([]);                     // 0





/*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
//======= Array and String Reverse =======//










/*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
//======= Array Shift and Unshift =======//










/*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
//======= Array Slice and Splice =======//










/*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
//======= Oddities =======//










/*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
//======= Array Comparison =======//





