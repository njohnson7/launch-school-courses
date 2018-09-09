/*
- double quoted strings
- comment spacing
- inconsistent use of periods in comments
- inconsistent use of backticks in comments
- trailing commas

___

- spacing before `}`: `{ firstName: "Sarah"}`
- add comma: " (i.e. `name`), "
- change to `:` or emdash: "JavaScript is a garbage-collected language; it automatically "
- newline after `if` block
- references 220 assignment, not 225: "Take note that there were two "Sarah" values in memory since it is a primitive value (for a refresher, check out this assignment) "
*/
//============================================================================//

let name = claim(32);  // Claim 32 bytes of memory for use by `name`
if (memoryNotAllocated(name)) {
  // handle allocation error here...
  return;
}
copy(name, 'Sarah'); // Copies 'Sarah' into claimed memory referenced by `name`
console.log(name);   // Do something with object referenced by `name`
release(name);       // Release memory for use by others
