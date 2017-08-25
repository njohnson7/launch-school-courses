


const encode = (str, n) => 1;


const decode = (str, n) => 1;


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

// decode_with_empty_string:
elog(decode('', 4), '',);

// decode_with_one_rail:
elog(decode('ABCDEFGHIJKLMNOP', 1), 'ABCDEFGHIJKLMNOP');

// decode_with_two_rails:
elog(decode('XXXXXXXXXOOOOOOOOO', 2), 'XOXOXOXOXOXOXOXOXO');

// decode_with_three_rails:
elog(decode('TEITELHDVLSNHDTISEIIEA', 3), 'THEDEVILISINTHEDETAILS');
