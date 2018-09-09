/*
- function keyword spacing
- trailing commas
- missing `var` before `obj =` (x3)
- typo: "`Array.protoetype.forEach`"


*/
//========================  =========================//


let obj = {
  a: 'A',
  logA() {
    let self = this;
    [1, 2].forEach(function (n) { p(n, self.a) });

    [1, 2].forEach(function (n) { p(n, this.a) }.bind(this));

    [1, 2].forEach(function (n) { p(n, this.a) }, this);

    [1, 2].forEach(n => p(n, this.a));
  },
};

obj.logA();

//========================  =========================//


// let obj = {
//   a: 'A',
//   logA() {
//     [1, 2].forEach(function (n) {
//       p(n, this.a)
//     });
//   },
// };

// obj.logA();
