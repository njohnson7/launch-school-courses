// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');

// var today = new Date(2017, 7, 2, 21, 31);
// var today2 = Date.now();
// var today3 = Date();
// var today4 = new Date();
// console.log(today);
// console.log(typeof today);
// console.log(today2);
// console.log(typeof today2);
// console.log(today3);
// console.log(typeof today3);
// console.log(today4);
// console.log(typeof today4);

// Date();            // Wed Aug 02 2017 21:34:35 GMT-0700 (PDT)
// typeof Date();     // string
// new Date();        // Wed Aug 02 2017 21:34:35 GMT-0700 (PDT)
// typeof new Date(); // object







// /*---------------- 2 -----------------*/console.log('\n\n-------- 2 ---------');

// var today = new Date();
// console.log(today.getDay());
// var dayOfWeek = today.getDay(); // 3
// console.log(`Today's date is ${dayOfWeek}`);





// /*---------------- 3 -----------------*/console.log('\n\n-------- 3 ---------');

// var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
// console.log(`Today's date is ${daysOfWeek[today.getDay()]}`)








// /*---------------- 4 -----------------*/console.log('\n\n-------- 4 ---------');

// var dayOfWeek = today.getDay();
// var weekDayName = daysOfWeek[dayOfWeek];
// var dayOfMonth = today.getDate();
// console.log(`Today's date is ${weekDayName} the ${dayOfMonth}th`);








// /*---------------- 5 -----------------*/console.log('\n\n-------- 5 ---------');
// // st: 1st, 21st, 31st
// // nd: 2nd, 22nd
// // rd: 3rd, 23rd
// // th: 4th - 20th, 24th - 30th
// function dateSuffix(num) {
//   var suffix = 'th';
//   if      ([1, 21, 31].includes(num)) suffix = 'st';
//   else if ([2, 22].includes(num))     suffix = 'nd';
//   else if ([3, 23].includes(num))     suffix = 'rd';

//   return String(num) + suffix;
// }

// // for (var i = 0; i < 32; i++) console.log(dateSuffix(i));
// console.log(dateSuffix(1));
// console.log(dateSuffix(2));
// console.log(dateSuffix(3));
// console.log(dateSuffix(4));






// /*---------------- 6 -----------------*/console.log('\n\n-------- 6 ---------');

// var month = today.getMonth();
// var dayOfMonth = dateSuffix(dayOfMonth);
// console.log(`Today's date is ${weekDayName}, ${month} ${dayOfMonth}`);








// /*---------------- 7 -----------------*/console.log('\n\n-------- 7 ---------');

// var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
//               'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
// var monthName = months[month];
// console.log(`Today's date is ${weekDayName}, ${monthName} ${dayOfMonth}`);








/*---------------- 8 -----------------*/console.log('\n\n-------- 8 ---------');

function formattedMonth(date) {
  var MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return MONTHS[date.getMonth()];
}

function formattedDay(date) {
  var DAYS_OF_WEEK = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return DAYS_OF_WEEK[date.getDay()];
}

function dateSuffix(date) {
  var num = date.getDate();
  var suffix = 'th';

  if      ([1, 21, 31].includes(num)) suffix = 'st';
  else if ([2, 22].includes(num))     suffix = 'nd';
  else if ([3, 23].includes(num))     suffix = 'rd';

  return String(num) + suffix;
}

function formattedDate(date) {
  var month = formattedMonth(date);
  var day   = formattedDay(date);
  var date  = dateSuffix(date);

  console.log(`Today's date is ${day}, ${month} ${date}`);
}

var today = new Date;
formattedDate(today);






/*---------------- 9 -----------------*/console.log('\n\n-------- 9 ---------');

console.log(today.getFullYear());
console.log(today.getYear());







/*---------------- 10 -----------------*/console.log('\n\n-------- 10--------');

console.log(today.getTime());







/*---------------- 11 -----------------*/console.log('\n\n-------- 11--------');

var tomorrow = new Date(today.getTime());
console.log(tomorrow);
tomorrow.setDate(today.getDate() + 1);
console.log(formattedDate(tomorrow));







/*---------------- 12 -----------------*/console.log('\n\n-------- 12--------');

var nextWeek = new Date(today.getTime());
console.log(nextWeek);
console.log(today);
console.log(today == nextWeek);  // false
console.log(today === nextWeek); // false






/*---------------- 13 -----------------*/console.log('\n\n-------- 13--------');

console.log(today.toDateString());
console.log(nextWeek.toDateString());
console.log(nextWeek.toDateString() == today.toDateString());
console.log(nextWeek.toDateString() === today.toDateString());

nextWeek.setDate(nextWeek.getDate() + 7);
console.log(nextWeek);
console.log(nextWeek.toDateString() == today.toDateString());
console.log(nextWeek.toDateString() === today.toDateString());







/*---------------- 14 -----------------*/console.log('\n\n-------- 14--------');

function formatTime(date) {
  var hours = String(date.getHours());
  var minutes = String(date.getMinutes());

  if (hours.length === 1) hours = '0' + hours;
  if (minutes.length === 1) minutes = '0' + minutes;

  return hours + ':' + minutes;
}

console.log(formatTime(today));
console.log(formatTime(nextWeek));
console.log(formatTime(new Date(2017,5,1,3,4)));
console.log(formatTime(new Date(2017,5,1,23,4)));
console.log(formatTime(new Date(2017,5,1,11,4)));
console.log(formatTime(new Date(2017,5,1,23,19)));

var d = new Date(2017,5,1,23,19);
console.log(d);
console.log(d.getHours());
console.log(d.getMinutes());
console.log(typeof d.getHours());
console.log(typeof d.getMinutes());

console.log(typeof today.getHours());
