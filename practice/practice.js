



// + function?

// infix

// associtativity


console.log(1 < 2 < 3);
console.log(3 < 2 < 1);

void 1;       // undefined
void 1 + 1;   // NaN
void (1 + 1); // undefined

var a = 1, b = 2, c = 3;
a = b = c;      // right-associativity
console.log(a); // 3

 // left-associativity:
console.log(3 < 2 < 1); // true
