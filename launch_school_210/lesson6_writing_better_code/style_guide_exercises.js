/*----------------- 1 --------------------*/console.log('-------- 1 ---------');

var title = "The Three-Body Problem";

// double quotes

var title = 'The Three-Body Problem';






/*---------------- 2 -----------------*/console.log('\n\n-------- 2 ---------');

var title = 'The Three-Body Problem',
    author = 'Cixin Liu',
    page_count = 400;

// - each var should be declared separately with one statement per declaration.
// - page_count should be in camelCase

var title = 'The Three-Body Problem';
var author = 'Cixin Liu';
var pageCount = 400;







/*---------------- 3 -----------------*/console.log('\n\n-------- 3 ---------');

var completed = lastPageRead == 400;

// use strict equality operator

var completed = lastPageRead === 400;








/*---------------- 4 -----------------*/console.log('\n\n-------- 4 ---------');

if (finishedBook())
  console.log('You have finished reading this book');

// use braces to wrap multi-line conditional statement blocks, or change to single line

if (finishedBook()) console.log('You have finished reading this book');

// or:
if (finishedBook()) {
  console.log('You have finished reading this book');
}




/*---------------- 5 -----------------*/console.log('\n\n-------- 5 ---------');

function read(pages) {
      console.log('You started reading.');
      for (var i=0; i<pages; i++) {
              var message = 'You read page '+i;
              console.log(message);
      }
}

read(400);

// - use 2 spaces for indentation, and be consistent
// - put spaces between (binary) operators and operands.
// - don't rely on JS's automatic implicit coercion/conversion of primitive types,
//   - instead, you should explicitly convert Numbers to Strings using String()
// - declare variables at the top of their scope.
// - don't use unary increment operator

function read(pages) {
  var message;
  console.log('You started reading.');
  for (var i = 0; i < pages; i += 1) {
    message = 'You read page ' + String(i);
    console.log(message);
  }
}

read(400);
