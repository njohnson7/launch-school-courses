/*
- input:  list of (increasing) nums as a String in shorthand range notation
- output: arr of nums in regular notation

- rules:
  - shorthand range notation
    - ex:
      - '1,3,7,2,4,1' => [1, 3, 7, 12, 14, 21]
      - '1-3,1-2'     => [1, 2, 3, 11, 12]
      - '1:3,1:2'     => [1, 2, 3, 11, 12]
  - range limits are always inclusive
  - possible separators:   -   :   ..
  - only the significant part of the next num is written b/c nums are always increasing

- algorithm:
  - fill in ranges with integers
  - figure out real values

*/


// const range = str => {
//   if (!str) return [];

//   str = str.replace(/:|\.\./g, '-')
//   let nums = str.split(',');
//   let result = [];

//   nums.forEach(n => {
//     if (!/-/.test(n)) {
//       result.push(Number(n));
//     } else {
//       let [first, last] = n.split('-').map(Number);
//       let temp = [];
//       for (let i = first; i <= last; i++) {
//         temp.push(i);
//       }

//       result = result.concat(temp);
//     }
//   });

//   let result2 = [];

//   result.forEach((n, i) => {
//     if (i === 0 || result2[result2.length - 1] < n) {
//       result2.push(n)
//     } else {
//       while (n <= result2[result2.length - 1]) n += 10;
//       result2.push(n);
//     }
//   });

//   return result2;
// };



const range = str => {
  if (!str) return [];

  str = str.replace(/:|\.\./g, '-');
  let result = [];
  let lastReplaced = '0';

  str = str.replace(/\d+/g, n => {
    let next = nextNum(lastReplaced, n);
    lastReplaced = next;
    return next;
  });

  let nums = str.split(',');

  nums.forEach(n => {
    if (!/-/.test(n)) {
      result.push(Number(n));
    } else {
      let temp = [];
      let [first, last] = [n.split('-')[0], n.split('-').slice(-1)[0]];
      [first, last] = [first, last].map(Number);

      for (let i = first; i <= last; i++) {
        temp.push(i);
      }

      result = result.concat(temp);
    }
  });

  return result;
};


const nextNum = (a, b) => {
  a = Number(a);
  if (a === undefined || a < Number(b)) return Number(b);

  for (let i = 1; i < Infinity; i++) {
    let newB = Number(String(i) + b);
    if (a < newB) return String(newB);
  }
};

// p(nextNum('104', '02'));
// p(nextNum('104', '2'));
// p(nextNum('545', '64'));
// p(nextNum('564', '11'));

elog(range('1,3,7,2,4,1'), [1, 3, 7, 12, 14, 21]);
elog(range('1-3,1-2'    ), [1, 2, 3, 11, 12]);
elog(range('1:3,1:2'    ), [1, 2, 3, 11, 12]);
elog(range('1-3,1:2'    ), [1, 2, 3, 11, 12]);
elog(range('1..3,1..2'  ), [1, 2, 3, 11, 12]);
// elog(range('14,12,3'  ), [1, 5, ]);
elog(range('1'    ),       [1]);
elog(range(''    ),        []);
p();

elog(range('1:5:2'    ),     [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]);
elog(range('104-2'    ),     [104, 105, 106, 107, 108, 109, 110, 111, 112]);
elog(range('104..02'    ),   [104, 105, '...', 202]);
elog(range('545,64:11'    ), [545, 564, 565, '...', 611]);


// # # input: str containing list of increasing nums separated by commas
// #   # ex: '1,3,7,2,4,1' == [1, 3, 7, 12, 14, 21]
// #   # can be range w/ 3 possible separators:  - : ..
// #     # ex:  [1, 2, 3, 11, 12] ==
// #     #      '1..3,1..2'
// #     #      '1-3,1-2'
// #     #      '1:3,1:2'
// # # output: arr of complete nums
// # # algorithm:
// #   # nums = str.split(',')
// #   # nums.flat_map do |num|
// #     # if num.size > 1
// #       # (left_digit..right_digit.to_a).map(&:to_i)
// #     # else, num.to_i
// #   # tens = 0
// #   # digits.map.with_index do |digit, idx|
// #     # tens += 10 if digits[idx - 1] >= digit
// #     # digit + tens


// # def shorthand(str)
// #   str = str.gsub(/\.\.|\:/, '-')
// #   str = str.gsub(/(\d)-(\d)-(\d)/, '\1-\2\2-\3')
// #   nums = str.scan(/\d(?:-\d)?/)
// #   nums = nums.flat_map do |n|
// #     if n.size > 1
// #      start_num = n[0].to_i
// #      end_num = n[-1].to_i
// #      end_num += 10 if end_num <= start_num
// #      (start_num..end_num).to_a
// #     else
// #       n.to_i
// #     end
// #   end
// #   result = []
// #   nums.each_with_index do |n, idx|
// #     n += 10 until n > result.last.to_i
// #     result << n
// #   end
// #   result
// # end

// # # p shorthand('1,3,7,2,4,1')  # [1, 3, 7, 12, 14, 21]
// # # p shorthand('1..3,1..2')    # [1, 2, 3, 11, 12]
// # # p shorthand('1-3,1-2')      # [1, 2, 3, 11, 12]
// # # p shorthand('1:3,1:2')      # [1, 2, 3, 11, 12]
// # # p shorthand('1:3,1:2,4:6')  # [1, 2, 3, 11, 12, 14, 15, 16]
// # # p shorthand('1:5:2')
// # # p shorthand('104-2')
// # # p shorthand('104..02')
// # # p shorthand('545,64:11')