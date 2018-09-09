/*
- input:
  - phone num String
    - can contain:
      - digits
      - special chars: should be ignored
        - ex:  space  -  .  ()
- output:
  - input cleaned up

- rules:
  - phone num:
    - if < 10 digts ---> bad
    - if > 11 digits ---> bad
    - if 10 digits ---> good
    - if 11 digits:
      - if first digit is not 1 ---> bad
      - if first digit is 1, trim 1 and use last 10 digits ---> good

  - if good, return cleaned up num
  - if bad, return '0' * 10

- data structure:
  - regex

- algorithm:
  - replace any non-digit chars
  - guard clause: return '0000000000' if num < 10 digits or num > 11 digits
  - return num if 10 digits
  - if 11 digits:
    - if first digit is not 1, return '000000000'
    - if first digit is 1, return num.slice(1)

*/

const BAD = '0000000000';

const clean = numStr => {
  numStr = numStr.replace(/\D/g, '');

  if (numStr.length === 10) return numStr;
  if (numStr.length < 10 || numStr.length > 11) return BAD;
  if (numStr[0] === '1') return numStr.slice(1);

  return BAD;
};

console.log(clean('123456789') === BAD);
console.log(clean('1') === BAD);
console.log(clean('') === BAD);
console.log(clean('20123456789') === BAD);
console.log(clean('101234567891') === BAD);
console.log(clean('12-123-345-6789') === BAD);

console.log(clean('0123456789') === '0123456789');
console.log(clean('10123456789') === '0123456789');
console.log(clean('1012345-6789') === '0123456789');
console.log(clean('1(012)345-6789') === '0123456789');
console.log(clean('1 (012) 345 - 6789') === '0123456789');
console.log(clean('(012) 345 - 6789') === '0123456789');
console.log(clean('(012) 345 -    6789') === '0123456789');
console.log(clean('1-123-345-6789') === '1233456789');
console.log(clean('1---123-345-6789') === '1233456789');
console.log(clean(' 1---()(1-502  ----34((-5-679-  ') === '1502345679');
