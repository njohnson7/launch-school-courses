// $(function () {
//   $('.modal_layer, .close').click(function (e) {
//     e.preventDefault();
//     $('.modal, .modal_layer').fadeOut();
//   });

//   $('#team li > a').click(function (e) {
//     e.preventDefault();
//     // let $modal_and_layer = $(this).nextAll();
//     // let $modal           = $modal_and_layer.first();
//     // let $layer           = $modal_and_layer.last();
//     // let $close           = $('.close', $modal);

//     // $modal.css('top', $(window).scrollTop() + 30);
//     // $modal_and_layer.fadeIn(400);

//     $('.modal').css('top', $(window).scrollTop() + 30);
//     $('.modal, .modal_layer').fadeIn();

//     // $([$layer[0], $close[0]]).click(function (e) {
//     //   e.preventDefault();
//     //   $modal_and_layer.fadeOut();
//     // });
//   });
// });


//============================================================================//


$(function () {
  function hideModal(e) {
    if (e.type == 'click') e.preventDefault();
    if ($('.modal:visible').length && (e.type == 'click' || e.key == 'Escape')) {
      $('.modal, .modal_layer').fadeOut();
    }
  }

  $('.modal_layer, .close').click(hideModal);
  $(document).keydown(hideModal);

  $('#team li > a').click(function (e) {
    e.preventDefault();
    let $modal = $(this).nextAll('.modal');
    let $layer = $(this).nextAll('.modal_layer');
    $modal.css('top', $(window).scrollTop() + 30);
    $([...$modal, ...$layer]).fadeIn();
  });
});
