/*----------------- 1 --------------------*/console.log('-------- 1 ---------');

function toDeg(rad) {
  return rad * 180 / Math.PI;
}

console.log(toDeg(0.524));  // 30°     π/6
console.log(toDeg(0.785));  // 45°     π/4
console.log(toDeg(1.047));  // 60°     π/3
console.log(toDeg(1.571));  // 90°     π/2
console.log(toDeg(3.142));  // 180°    π
console.log(toDeg(4.712));  // 270°   3π/2
console.log(toDeg(6.283));  // 360°   2π






/*---------------- 2 -----------------*/console.log('\n\n-------- 2 ---------');

var x = -180;
console.log(Math.abs(x)); // 180







/*---------------- 3 -----------------*/console.log('\n\n-------- 3 ---------');

console.log(Math.sqrt(16777216)); // 4096








/*---------------- 4 -----------------*/console.log('\n\n-------- 4 ---------');

console.log(Math.pow(16, 6)); // 16777216







/*---------------- 5 -----------------*/console.log('\n\n-------- 5 ---------');

var a = 50.72;
var b = 49.2;
var c = 49.86;

console.log(Math.floor(a));
console.log(Math.ceil(b));
console.log(Math.round(c));







/*---------------- 6 -----------------*/console.log('\n\n-------- 6 ---------');

function rando(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

console.log(rando(1, 1));
console.log(rando(1, 2));
console.log(rando(1, 3));
console.log(rando(1, 5));
console.log(rando(1, 10));
console.log(rando(1, 50));
console.log(rando(1, 100));
console.log(rando(1, 1000));
console.log(rando(11, 63));
