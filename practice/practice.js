



var count = [1, 2, 3];
count.length = 10;
count;  // [ 1, 2, 3, undefined x 7 ]
count.length = 2;
count;  // [ 1, 2 ] - excess elements are lost


typeof []; // 'object'


Array.isArray([]);      // true
Array.isArray('array'); // false