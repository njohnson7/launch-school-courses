const encode = (str, n) => [].concat(...getRails(str, n)).join('');

const decode = (str, n) => {
  let rails        = getRails(str, n);
  let indices      = getIndices(str, n);
  let chars        = [...str];
  let decodedRails = rails.map(rail => chars.splice(0, rail.length));
  return indices.map(i => decodedRails[i].shift()).join('');
};

const getRails = (str, n) => {
  let rails   = [...Array(n)].map(_ => []);
  let indices = getIndices(str, n);
  indices.forEach((i, j) => rails[i].push(str[j]));
  return rails;
};

const getIndices = (str, n) => {
  let seq = [...Array(n).keys()];
  seq     = seq.concat(seq.slice(1).reverse().slice(1));
  return [...Array(str.length)].map((_, i) => seq[i % seq.length]);
};



// encode_with_empty_string:
elog(encode('', 4), '',);

// encode_with_one_rail:
elog(encode('One rail, only one rail', 1), 'One rail, only one rail');

// encode_with_two_rails:
elog(encode('XOXOXOXOXOXOXOXOXO', 2), 'XXXXXXXXXOOOOOOOOO');

// encode_with_three_rails:
elog(encode('WEAREDISCOVEREDFLEEATONCE', 3), 'WECRLTEERDSOEEFEAOCAIVDEN');

// encode_with_ending_in_the_middle:
elog(encode('EXERCISES', 4), 'ESXIEECSR',);

// encode_with_less_letters_than_rails:
elog(encode('More rails than letters', 24), 'More rails than letters');


p();
// decode_with_empty_string:
elog(decode('', 4), '',);

// decode_with_one_rail:
elog(decode('ABCDEFGHIJKLMNOP', 1), 'ABCDEFGHIJKLMNOP');

// decode_with_two_rails:
elog(decode('XXXXXXXXXOOOOOOOOO', 2), 'XOXOXOXOXOXOXOXOXO');

// decode_with_three_rails:
elog(encode('THEDEVILISINTHEDETAILS', 3), 'TEITELHDVLSNHDTISEIIEA');
elog(decode('TEITELHDVLSNHDTISEIIEA', 3), 'THEDEVILISINTHEDETAILS');

elog(decode('WECRLTEERDSOEEFEAOCAIVDEN', 3), 'WEAREDISCOVEREDFLEEATONCE');
