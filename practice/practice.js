var a;
var setScope;
a = 'outer';

console.log(a);
// setScope();
console.log(a);

setScope = function() {
  a = 'inner';
}

console.log(a);
setScope();
console.log(a);

