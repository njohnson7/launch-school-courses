// var password = '123';
// var count = 0;

// while (true) {
//   var guess = prompt('What is the password:');
//   count++;
//   if (guess === password) {
//     console.log('You have successfully logged in.');
//     break;
//   } else if (count === 3) {
//     console.log('You have been denied access');
//     break;
//   }
// }

var password = '123';
var count = 0;

do {
  var guess = prompt('What is the password:');
  if (guess === password) break;
  count++;
} while (count < 3);

console.log('You have ' + (count === 3 ? 'been denied access.' : 'successfully logged in.'));




// password = 'password'

// The program displays a dialog that asks the user to enter a password.
// If the user enters the wrong password, keep asking up to three times. After
// three failures, log the access denied.

// What is the password: 123
// What is the password: opensesame
// What is the password: letmein

// message on the console
// You have been denied access.

// If the user enters the right password, report login success.
// What is the password: password

// message on the console
// You have successfully logged in.