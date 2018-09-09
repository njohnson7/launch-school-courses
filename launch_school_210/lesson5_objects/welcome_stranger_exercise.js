/*
- input: arr, obj
  - arr => 2+ elems, when combined w/ spaces, produce a person's full name
  - obj => 2 keys: title, occupation
    - suitable values for both
- output: log a greeting to the console
  - uses the person's full name
  - mentions the person's title and occupation
*/

function greetings(names, job) {
  var fullName = names.join(' ');
  var jobStr = job.title + ' ' + job.occupation;
  return 'Hello, ' + fullName + '! Nice to have a ' + jobStr + ' around.';
}

// alt:
function greetings(names, job) {
  return `Hello, ${names.join(' ')}! Nice to have a ${job.title} ${job.occupation} around.`;
}


console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));
console.log(greetings(['Bob', 'Fred', 'S', 'Stevenson'], { title: 'Super', occupation: 'Splicer' }));
console.log(greetings(['Eric', 'Smith'], { title: 'Crazy', occupation: 'Guy' }));

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
