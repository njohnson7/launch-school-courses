/*----------------- 1 --------------------*/console.log('-------- 1 ---------');
function objectHasProperty(obj, key) {
  for (var k in obj) {
    if (k === key) return true;
  }

  return false;
}

// alt:
function objectHasProperty(obj, key) {
  return Object.keys(obj).includes(key);
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};
console.log(objectHasProperty(pets, 'dog'));       // true
console.log(objectHasProperty(pets, 'lizard'));    // false
console.log(objectHasProperty(pets, 'mice'));      // true





/*---------------- 2 -----------------*/console.log('\n\n-------- 2 ---------');

function incrementProperty(obj, key) {
  return obj[key] ? ++obj[key] : obj[key] = 1;
}

var wins = {
  steve: 3,
  susie: 4,
};
console.log(incrementProperty(wins, 'susie'));   // 5
console.log(wins);                               // { steve: 3, susie: 5 }
console.log(incrementProperty(wins, 'lucy'));    // 1
console.log(wins);                               // { steve: 3, susie: 5, lucy: 1 }





/*---------------- 3 -----------------*/console.log('\n\n-------- 3 ---------');

function copyProperties(obj1, obj2) {
  var count = 0;
  for (var prop in obj1) {
    obj2[prop] = obj1[prop];
    count++;
  }

  return count;
}


var hal = {
  model: 9000,
  enabled: true,
};
var sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }





/*---------------- 4 -----------------*/console.log('\n\n-------- 4 ---------');

function wordCount(str) {
  var count = {};
  var word = '';

  for (var i = 0; i < str.length; i++) {
    if (str[i] === ' ') {
      count[word] ? count[word]++ : count[word] = 1;
      word = '';
    } else {
      word += str[i];
    }
  }

  if (word) count[word] ? count[word]++ : count[word] = 1;
  return count;
}

// alt:
function wordCount(str) {
  var count = {};
  var words = str.match(/\w+/g);
  words.forEach(function(word) {
    count[word] ? count[word]++ : count[word] = 1;
  });

  return count;
}

// alt 2:
function wordCount(str) {
  var count = {};
  var words = str.split(' ');
  words.forEach(function(word) {
    if (!count[word]) count[word] = 0;
    count[word]++;
  });

  return count;
}

console.log(wordCount('box car cat bag box'));    // { box: 2, car: 1, cat: 1, bag: 1 }
