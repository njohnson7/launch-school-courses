/*

- input: 2 version num Strings
  - ex: 1, 1.0, 1.2, 3.2.3, 3.0.0, 4.2.3.0

- output: result of comparison of 2 version nums

- rules:
  - return:
    - if v1 > v2,   then 1
    - if v1 < v2,   then -1
    - if v1 === v2, then 0
    - else if either version num contains chars besides digits and . ----> then null
  - comparison:
    - ex:  0.1 < 1 == 1.0 < 1.1 < 1.2 == 1.2.0.0 < 1.18.2 < 13.37

- algorithm:
  - guard clause: return null if either version num matches /[^\d.]/
  - compare version nums:
    - normalize strings:
      - remove any trailing 0's and dots
    - compare each corresponding section
      - split on .
      - map each section --> convert to num
    - if equal, move on to next section
    - if not equal, return 1 if a > b, or -1 if a < b
    - if no more sections on one, but some on other, other is greater
    - else if no more sections on both return 0

*/

// const compareVersions = (v1, v2) => {
//   if (![v1, v2].every(v => /^((\d+\.)+\d+|[1-9]+\d*)$/.test(v))) return null;
//   [v1, v2] = [v1, v2].map(v => (v.replace(/(0*\.?)+0*$/, '').split('.').map(Number)));

//   let minLength = Math.min(...[v1, v2].map(v => v.length));

//   for (let i = 0; i < minLength; i++) {
//     if (v1[i] === v2[i]) continue;
//     return v1[i] > v2[i] ? 1 : -1;
//   }

//   if (v1.length === v2.length) return 0;
//   else if (v1.length > v2.length) return 1;
//   else return -1;
// };


function compareVersions(versionA, versionB) {
  var aParts, bParts, aValue, bValue, maxLength;
  var validChars = /^[0-9]+(\.[0-9]+)*$/;

  if (!validChars.test(versionA) || !validChars.test(versionB)) {
    return null;
  }

  aParts = versionA.split('.').map(Number);
  bParts = versionB.split('.').map(Number);
  maxLength = Math.max(aParts.length, bParts.length);

  for(var i = 0; i < maxLength; i++) {
    aValue = aParts[i] || 0;
    bValue = bParts[i] || 0;

    if (aValue > bValue) {
      return 1;
    } else if (aValue < bValue) {
      return -1;
    }
  }

  return 0;
}


console.log(compareVersions('0.1', '1')       === -1);
console.log(compareVersions('1',   '0.1')     === 1);
console.log(compareVersions('1',   '1')       === 0);
console.log(compareVersions('0.1', '0.1')     === 0);

console.log(compareVersions('1',   '1.0')     === 0);
console.log(compareVersions('1.0', '1.1')     === -1);
console.log(compareVersions('1.1', '1.2')     === -1);
console.log(compareVersions('1.2', '1.1')     === 1);
console.log(compareVersions('1.2', '1.2.0')   === 0);
console.log(compareVersions('1.2', '1.2.0.0') === 0);
console.log(compareVersions('1.2', '13.37')   === -1);


console.log(compareVersions('1.2', '1.18.2')  === -1);   // wrong...?
// console.log(compareVersions('1.2', '1.18.2')  === 1); // fixed?

console.log(compareVersions('1',  '1.')   === null );
console.log(compareVersions('1',  '1.1.') === null );
console.log(compareVersions('1',  '1.1..') === null );
console.log(compareVersions('.',  '1') === null );
console.log(compareVersions('..',  '1') === null );
console.log(compareVersions('.1',  '1') === null );

console.log('zero.....');
console.log(compareVersions('0',  '1')   === null);

console.log('negative....');
console.log(compareVersions('-1', '1')   === null);

console.log(compareVersions('1.2',  '1,2') === null);
console.log(compareVersions('1.2',  '1a')  === null);
console.log(compareVersions('a2', '5')   === null);
console.log(compareVersions('2',  '')    === null);
console.log(compareVersions('2',  ' ')   === null);





// given:
console.log('given.......');
console.log(compareVersions('1', '1') ===         0);
console.log(compareVersions('1.1', '1.0') ===     1);
console.log(compareVersions('2.3.4', '2.3.5') === -1);
console.log(compareVersions('1.a', '1') ===       null);
console.log(compareVersions('.1', '1') ===        null);
console.log(compareVersions('1.', '2') ===        null);
console.log(compareVersions('1..0', '2.0') ===    null);
console.log(compareVersions('1.0', '1.0.0') ===   0);
console.log(compareVersions('1.0.0', '1.1') ===   -1);
console.log(compareVersions('1.0', '1.0.5') ===   -1);


console.log(compareVersions('1..1', '5')   === null);