/*
- `--` operators
- `var`s top of scope
- comment spacing

*/
//========================  =========================//

var temperatures = [53, 86, 12, 43];

function average() {
  var total = 0;
  // p(this.length)
  // p(this[0])
  // p(this.total)

  for (let i = this.length - 1; i >= 0; i--) {
    total += this[i];
  }

  return total / this.length;
}

console.log(average.apply(temperatures));       // 48.5

let avg2 = average.bind(temperatures);
let avg3 = average.bind(this);
p(avg2());
p(avg3());

temperatures.a = average;
temperatures.b = avg2;
temperatures.c = avg3;
p(temperatures.a());
p(temperatures.b());
p(temperatures.c());
