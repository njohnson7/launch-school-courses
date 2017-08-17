// /*----------------- 1 --------------------*/console.log('-------- 1 ---------');
// //============= Alphabetical Numbers =============//

// const NUMS = {
//   0: 19, 1: 9, 2: 18, 3: 16, 4: 5, 5: 4, 6: 12, 7: 10, 8: 0, 9: 7, 10: 14,
//   11: 2, 12: 17, 13: 15, 14: 6, 15: 3, 16: 13, 17: 11, 18: 1, 19: 8
// };

// const NUMS = [19, 9, 18, 16, 5, 4, 12, 10, 0, 7, 14, 2, 17, 15, 6, 3, 13, 11, 1, 8];
// const alphabeticNumberSort = nums => [...nums].sort((a, b) => NUMS[a] - NUMS[b]);


function alphabeticNumberSort(arr) {
  var alphaArr = ['zero','one','two','three','four','five','six','seven','eight','nine','ten','eleven',
                  'twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']

  return alphaArr.slice().sort().map(function(value) {
    return alphaArr.indexOf(value);
  });
}


// function shuffle(originalArray) {
//   var array = [].concat(originalArray);
//   var currentIndex = array.length, temporaryValue, randomIndex;

//   // While there remain elements to shuffle...
//   while (0 !== currentIndex) {

//     // Pick a remaining element...
//     randomIndex = Math.floor(Math.random() * currentIndex);
//     currentIndex -= 1;

//     // And swap it with the current element.
//     temporaryValue = array[currentIndex];
//     array[currentIndex] = array[randomIndex];
//     array[randomIndex] = temporaryValue;
//   }

//   return array;
// }

p(42);


let numz = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
let numz2 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 19, 4, 2, 1, 9, 3, 11, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];

p(shuffle(numz));
p(shuffle(numz2));


p(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
      [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));


p(eql(alphabeticNumberSort([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]),
      [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]));










// /*---------------- 2 -----------------*/console.log('\n--------- 2 ----------');
// //============= Sum of Digits =============//














// /*---------------- 3 -----------------*/console.log('\n--------- 3 ----------');
// //============= Multiply All Pairs =============//















// /*---------------- 4 -----------------*/console.log('\n--------- 4 ----------');
// //============= Sum of Sums =============//














// /*---------------- 5 -----------------*/console.log('\n--------- 5 ----------');
// //============= Leading Substrings =============//














// /*---------------- 6 -----------------*/console.log('\n--------- 6 ----------');
// //============= All Substrings =============//














// /*---------------- 7 -----------------*/console.log('\n--------- 7 ----------');
// //============= Palindromic Substrings =============//














// /*---------------- 8 -----------------*/console.log('\n--------- 8 ----------');
// //============= Grocery List =============//














// /*---------------- 9 -----------------*/console.log('\n--------- 9 ----------');
// //============= Inventory Item Transactions =============//














// /*---------------- 10 -----------------*/console.log('\n--------- 10 --------');
// //============= Inventory Item Availability =============//









