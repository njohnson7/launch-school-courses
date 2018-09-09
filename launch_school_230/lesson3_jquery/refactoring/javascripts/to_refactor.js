$(function () {
  const STONES = {
    January:   'garnet',
    February:  'amethyst',
    March:     'aquamarine or bloodstone',
    April:     'diamond',
    May:       'emerald',
    June:      'pearl, moonstone, or alexandrite',
    July:      'ruby',
    August:    'peridot',
    September: 'sapphire',
    October:   'opal or tourmaline',
    November:  'topaz or citrine',
    December:  'turquoise, zircon, or tanzanite',
  };

  function showBirthstone($month) {
    $('#birthstone').text(`Your birthstone is ${STONES[$month.text()]}`);
  }

  function isValidCcNum(num) {
    let digits = [...num.replace(/\D/g, '')].reverse().map(Number);
    if (/[^0-9 ]/.test(num) || digits.length != 16) return false;

    let sum = digits.reduce((sum, n, i) => sum + (n && (i % 2 ? (n * 2 % 9 || 9) : n)), 0);
    return sum % 10 == 0;
  }

  $('nav').hover(_ => $('.submenu').toggle());

  $(document).click(function (e) {
    let $target = $(e.target);
    if (!$target.is('.button, .toggle, .month a')) return;

    e.preventDefault();
    if      ($target.is('.button')) $target.toggleClass('clicked');
    else if ($target.is('.toggle')) $('.accordion').toggleClass('opened');
    else                            showBirthstone($target);
  });

  $('form').on('submit', function (e) {
    e.preventDefault();
    let valid = isValidCcNum($('.cc-num').val());
    $('.success').toggle(valid);
    $('.error').toggle(!valid);
  });
});
