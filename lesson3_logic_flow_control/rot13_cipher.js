// 'a'..'z' ==> 97..122
//    <= 110: +13
//    >  110: -13
// 'a'..'z' ==> 65..90
//    <= 78 + 13

function rot13(str) {
  for (var i = 0, charCode, newStr = ''; i < str.length; i++) {
    charCode = str.charCodeAt(i);
    if (charCode >= 97 && charCode < 110 || charCode >= 65 && charCode < 78) {
      charCode += 13;
    } else if (charCode >= 110 && charCode <= 122 || charCode >= 78 && charCode <= 90) {
      charCode -= 13;
    }

    newStr += String.fromCharCode(charCode);
  }

  return newStr;
}

function rot13(str) {
  var LOWER_A_CODE = 97;
  var LOWER_N_CODE = 110;
  var LOWER_Z_CODE = 122;
  var UPPER_A_CODE = 65;
  var UPPER_N_CODE = 78;
  var UPPER_Z_CODE = 90;
  var AMOUNT_TO_ROTATE = 13;
  var newStr = '';
  var charCode;

  for (var i = 0; i < str.length; i++) {
    charCode = str.charCodeAt(i);
    if (
      charCode >= LOWER_A_CODE && charCode < LOWER_N_CODE ||
      charCode >= UPPER_A_CODE && charCode < UPPER_N_CODE
    ) {
      charCode += AMOUNT_TO_ROTATE;
    } else if (
        charCode >= LOWER_N_CODE && charCode <= LOWER_Z_CODE ||
        charCode >= UPPER_N_CODE && charCode <= UPPER_Z_CODE
      ) {
      charCode -= AMOUNT_TO_ROTATE;
    }

    newStr += String.fromCharCode(charCode);
  }

  return newStr;
}

console.log(rot13('abc'));          // nop
console.log(rot13('xyz'));          // klm
console.log(rot13('ABC'));          // NOP
console.log(rot13('AbC xYz'));      // NoP kLm
console.log(rot13(' 12o3 !.asM#')); //  12b3 !.nfZ#
console.log(rot13('abcdefghijklmnopqrstuvwxyz')); // nopqrstuvwxyzabcdefghijklm
console.log(rot13('ABCDEFGHIJKLMNOPQRSTUVWXYZ')); // NOPQRSTUVWXYZABCDEFGHIJKLM
console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// Teachers open the door, but you must enter by yourself.
