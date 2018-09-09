/*------------------------ 1 ------------------------*/ console.log('--1--');
var apples = 3;
var bananas = 5;

if (apples == bananas) {
  console.log('apples == bananas');
}







/*------------------------ 2 ------------------------*/ console.log('\n--2--');
bananas = '3';

if (apples == bananas) {
  console.log('apples == bananas');
}







/*------------------------ 3 ------------------------*/ console.log('\n--3--');
if (apples === bananas) {
  console.log('equal');
}

// the condition is false b/c there is no implicit type conversion with the strict equality operator.









/*------------------------ 4 ------------------------*/ console.log('\n--4--');

if (apples === bananas) {
  console.log('equal');
} else {
  console.log('not equal');
}







/*------------------------ 5 ------------------------*/ console.log('\n--5--');

if (apples === bananas) {
  console.log('strict equal');
} else if (apples == bananas) {
  console.log('same value, but different types');
} else {
  console.log('not equal');
}







/*------------------------ 6 ------------------------*/ console.log('\n--6--');

if (apples === bananas) {
  console.log('strict equal');
} else {
  if (apples == bananas) {
    console.log('same value, but different types');
  } else {
    console.log('not equal');
  }
}






/*------------------------ 7 ------------------------*/ console.log('\n--7--');

apples = 3;
bananas = 3;
var areEqual = apples === bananas

console.log(areEqual);







/*------------------------ 8 ------------------------*/ console.log('\n--8--');

apples = 3;
bananas = undefined;
var eitherOr = apples || bananas;
console.log(eitherOr);

var eitherOr = apples || bananas;
console.log(eitherOr);







/*------------------------ 9 ------------------------*/ console.log('\n--9--');

bananas = 1;
eitherOr = apples || bananas;
console.log(eitherOr);

eitherOr = bananas || apples;
console.log(eitherOr);









/*------------------------ 10 ------------------------*/ console.log('\n--10--');

var lastName = 'Smith'
var familyMessage = lastName === 'Smith' ? "you're family" : "you're not family"
console.log(familyMessage);  // "you're family"

var familyMessage = lastName === 'Jones' ? "you're family" : "you're not family"
console.log(familyMessage);
