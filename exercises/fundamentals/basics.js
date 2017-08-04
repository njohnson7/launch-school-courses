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





String(thing);


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






/*---------------- 5 -----------------*/console.log('\n\n-------- 5 ---------');
//===== Arithmetic Integer: =====//










/*---------------- 6 -----------------*/console.log('\n\n-------- 6 ---------');
//===== Counting the Number of Characters: =====//










/*---------------- 7 -----------------*/console.log('\n\n-------- 7 ---------');
//===== Convert String to a Number: =====//










/*---------------- 8 -----------------*/console.log('\n\n-------- 8 ---------');
//===== Convert String to a Signed Number: =====//










/*---------------- 9 -----------------*/console.log('\n\n-------- 9 ---------');
//===== Convert a Number to a String: =====//










/*---------------- 10 -----------------*/console.log('\n\n-------- 10--------');
//===== Convert a Signed Number to a String: =====//





