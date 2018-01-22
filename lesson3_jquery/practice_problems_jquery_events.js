// $(function () {
//   let key;
//   let $accordion = $('#accordion');

//   $('form').submit(function (e) {
//     e.preventDefault();
//     let k = $('#key').val();
//     if (k) {
//       key = k;
//       $(document).off('keypress').keypress(function (e) {
//         p(e);
//         p(e.key);
//         if (e.key === key) $accordion.slideToggle();
//       });
//     }
//   });

//   $('a').click(function (e) {
//     e.preventDefault();
//     if (key) {
//       let keypress = $.Event('keypress', { key });
//       $(document).trigger(keypress);
//     }
//   });
// });


//============================================================================//


$(function () {
  $('form').submit(function (e) {
    e.preventDefault();
    let key = $('#key').val();
    if (key) {
      $(document).off('keypress').keypress(function (e) {
        if (e.key === key) $('a').click();
      });
    }
  });

  $('a').click(function (e) {
    e.preventDefault();
    $('#accordion').slideToggle();
  });

  $('#clear').click(function (e) {
    $(document).off('keypress');
    $('#key').val('');
  });
});
