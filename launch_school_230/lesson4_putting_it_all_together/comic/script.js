// $(function () {
//   function hideBlinds($blinds) {
//     $blinds.each(function (i) {
//       this.timeoutId = setTimeout(hideDown, i * 1500, this);
//     });
//   }

//   function hideDown(elem) {
//     $(elem).animate({
//       height:    0,
//       marginTop: $(elem).height(),
//     }, 250, function () {
//       $(this).css({
//         display:   'none',
//         height:    $(this).css('marginTop'),
//         marginTop: 0,
//       });
//     });
//   }

//   let $blinds = $('[id^=blind]');
//   hideBlinds($blinds);

//   $('#restart').click(function (e) {
//     $blinds.each(function () {
//       clearTimeout(this.timeoutId);
//     }).finish().show();

//     hideBlinds($blinds);
//   });
// });



//============================================================================//


$(function () {
  const $blinds = $('[id^=blind]');
  $blinds.hideDown = function (delay = 1500, speed = 250) {
    this.each(function (i, b, $blind = $(b)) {
      $blind.delay(delay * i + speed).animate({
        height:    0,
        marginTop: $blind.height(),
      }, speed, $blind.hide);
    });
  };

  $('#restart').click(_ => $blinds.finish().removeAttr('style').hideDown()).click();
});
