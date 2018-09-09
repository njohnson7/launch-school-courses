// var score1 = Number(prompt('Enter score 1:'));
// var score2 = Number(prompt('Enter score 2:'));
// var score3 = Number(prompt('Enter score 3:'));
// var avg = (score1 + score2 + score3) / 3;

// var grade = 'F';
// if      (avg >= 90) grade = 'A';
// else if (avg >= 70) grade = 'B';
// else if (avg >= 50) grade = 'C';

// console.log('Based on the average of your 3 scores your letter grade is "' + grade + '".');

// prompts to get the 3 scores
// Enter score 1: 90
// Enter score 2: 50
// Enter score 3: 78

// log to the console
// Based on the average of your 3 scores your letter grade is "B".


// FE:
function findAvg(nums) {
  for (var i = 0, sum = 0, len = nums.length; i < len; i++) {
    sum += nums[i];
  }
  return sum / len;
}

function findGrade(score) {
  var grade = 'F';
  if      (avg >= 90) grade = 'A';
  else if (avg >= 70) grade = 'B';
  else if (avg >= 50) grade = 'C';
  return grade;
}

var num = 1;
var scores = [];

while (true) {
  var score = prompt('Enter score ' + String(num) + ', or "f" if finished:')
  if (score.toLowerCase()[0] === 'f') break;
  scores.push(Number(score));
}

avg = findAvg(scores);
grade = findGrade(avg);

console.log('Based on the average of your ' + scores.length + ' scores your' +
            ' letter grade is "' + grade + '".');
