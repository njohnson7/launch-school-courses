// 1
var x = '13';
var y = 9;
console.log(x + y);
console.log(parseInt(x, 10) + y);
console.log(parseFloat(x) + y);
console.log(Number(x) + y);



// 2
console.log('--2--');

var x = '13';
var y = 9;
console.log(x * y); // 117 => number




// 3
console.log('--3--');

var npa = 212;
var nxx = 555;
var num = 1212;

console.log(npa.toString() + String(nxx) + num.toString());

npa = '' + npa + nxx + num
console.log(npa);





// 4
console.log('--4--');

var npa = 212;
var nxx = 555;
var num = 1212;

console.log(String(npa) + String(nxx) + String(num));




// 5
console.log('--5--');

console.log(true.toString());
console.log([1, 2, 3].toString());

var bool = true;
var arr = [1, 2, 3];

console.log(bool.toString());
console.log(arr.toString());
console.log(String(bool));
console.log(String(arr));
