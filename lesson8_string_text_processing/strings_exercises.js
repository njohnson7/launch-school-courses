// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');

// var firstName = 'Bob';
// var lastName  = 'Loblaw';

// var fullName = firstName + ' ' + lastName;
// console.log(fullName);

// var fullName = [firstName, lastName].join(' ');
// console.log(fullName);

// var fullName = `${firstName} ${lastName}`;
// console.log(fullName);

// var fullName = firstName.concat(' ', lastName);
// console.log(fullName);






// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');

// console.log(firstName.concat(lastName));







// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');

// console.log(fullName.split(' '));








// // /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');

// var language = 'JavaScript';
// var idx = language.indexOf('S');
// console.log(idx);







// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');

// var charCode = language.charCodeAt(idx);
// console.log(charCode);







// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');

// console.log(String.fromCharCode(charCode));







// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');

// console.log(language.lastIndexOf('a'));







// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');

// var a = 'a';
// var b = 'b';

// console.log(a > b);
// console.log(b > a);



// var b = 'B';

// console.log(a > b);
// console.log(b > a);






// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');

// var language = 'JavaScript';
// var aIndex = language.indexOf('a');
// var vIndex = language.indexOf('v');

// console.log(language.substr(aIndex, 4));
// console.log(language.substr(vIndex, 4));







// // /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');


// console.log(language.substring(aIndex, 4));
// console.log(language.substring(vIndex, 4));









// /*----------------- 11 --------------------*/console.log('-------- 1 ---------');

// var fact1 = 'JavaScript is fun';
// var fact2 = 'Kids like it too';

// var compoundSentence = fact1 + ' and ' + fact2.toLowerCase();
// console.log(compoundSentence);







// // /*---------------- 12 -----------------*/console.log('\n--------- 2 ----------');

// console.log(fact1[0]);
// console.log(fact2[0]);







// /*---------------- 13 -----------------*/console.log('\n--------- 3 ----------');

// var pi = 22 / 7;
// pi = pi.toString();

// console.log(pi);
// console.log(pi.lastIndexOf('14'));







// /*---------------- 14 -----------------*/console.log('\n--------- 4 ----------');

// var boxNumber = (356).toString();
// console.log(boxNumber);


// // 356.toString(); // syntax error

// (356).toString(); // '356'
// 356..toString();  // '356'

// console.log(boxNumber);





// /*---------------- 15 -----------------*/console.log('\n--------- 15 ----------');


// console.log(typeof boxNumber);

// boxNumber = parseInt(boxNumber, 10);
// console.log(typeof boxNumber);

// boxNumber = String(boxNumber);
// console.log(typeof boxNumber);






// /*---------------- 16 -----------------*/console.log('\n--------- 16 ----------');

var name = prompt('What is your name?');
var greeting = `Hello ${name.replace('!', '')}.`;
if (name.endsWith('!')) greeting = `${greeting} why are we screaming?`.toUpperCase();
console.log(greeting);


// What is your name? Bob
// Hello Bob.                            // console output


// What is your name? Bob!
// HELLO BOB. WHY ARE WE SCREAMING?      // console output