/*

- trailing commas
- object braces spacing
- function keyword spacing
- newline before comment

*/

// let sedan = {
//   speed: 0,
//   rate:  8,
//   accelerate() {
//     this.speed += this.rate;
//   },
// };


// //======================== 1 =========================//

// const makeCar = rate => ({
//   speed: 0,
//   rate,
//   accelerate() {
//     this.speed += this.rate;
//   },
// });

// let sedan = makeCar(8);
// sedan.accelerate();
// p(sedan.speed);           // 8

// let coupe = makeCar(12);
// coupe.accelerate();
// p(coupe.speed);           // 12


// //======================== 2 =========================//

// let hatchback = makeCar(9);
// hatchback.accelerate();
// p(hatchback.speed);           // 9


//======================== 3 =========================//

const makeCar = (accelRate, brakeRate) => ({
  speed: 0,
  accelRate,
  brakeRate,
  accelerate() {
    this.speed += this.accelRate;
  },
  brake() {
    this.speed = Math.max(this.speed - this.brakeRate, 0);
  },
});

var sedan = makeCar(8, 6);
sedan.accelerate();
p(sedan.speed);
// 8
sedan.brake();
p(sedan.speed);
// 2
sedan.brake();
p(sedan.speed);
// 0
