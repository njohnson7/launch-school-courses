/*
- 2 functions: run-length encoding, and decoding
  - ex: 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB' => '12WB12W3B24WB'
  - ex: 'AABCCCDEEEE' => '2AB3CD4E'

- input: string
- output: string with consec. chars combined into the number in a row + the char
  - ex: 'AAAB' => '3AB'

- rules:
  - if 1, don't prefix w/ num
  - else, prefix with num

*/

const encode = str => str.replace(/(.)\1+/g, (m, c) => `${m.length}${c}`);

const decode = str => str.replace(/(\d+)(.)/g, (_, n, c) => c.repeat(n));


elog(encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'), '12WB12W3B24WB');
elog(encode('AABCCCDEEEE'), '2AB3CD4E');
elog(encode('A'), 'A');
p();

elog(decode('12WB12W3B24WB'), 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB');
elog(decode('2AB3CD4E'), 'AABCCCDEEEE');
elog(decode('A'), 'A');
elog(decode(''), '');
