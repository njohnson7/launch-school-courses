/* eslint-disable */
/*
- add click event to thumbnails
  - trigger change from example photo to thumbnail (based on thumbnail index)
- add transition
- Another feature usually present in slideshows is the abilty to click links to move forward and backward one slide.
- Add those controls, then figure out how to both loop the slidehsow around to the other end when you've gone past the first or last slide
- and figure out how to show or hide the next and previous links based on where you are in the slide order.
*/
/* eslint-enable */

$(function () {
  const getCurrentPhoto = _ => $photos.filter(':visible');
  const getCurrentThumb = _ => $thumbs.filter('.active');
  const getCurrentIndex = _ => $photos.index(getCurrentPhoto());

  let $photos   = $('.primary-row img');
  let $thumbs   = $('.sub-row img');
  let $figure   = $('figure');
  let $controls = $('.controls');

  $controls.click(function (e) {
    e.preventDefault();
    let $control  = $(this);
    let direction = $control.hasClass('previous') ? -1 : 1;

    let $currentPhoto = getCurrentPhoto();
    let idx           = (getCurrentIndex() + direction) % $photos.length;
    let $nextPhoto    = $photos.eq(idx);

    $photos.stop(true);
    $currentPhoto.fadeOut({
      duration: 300,
      complete: _ => $photos.eq(idx).fadeIn(300),
    });

    let $currentThumb = getCurrentThumb();
    $currentThumb.removeClass('active');
    $thumbs.eq(idx).addClass('active');
  });

  $figure.hover(
    _ => $controls.stop().fadeIn(200),
    _ => $controls.stop().fadeOut(200),
  );

  $thumbs.click(function () {
    let $currentPhoto = getCurrentPhoto();
    let idx           = $thumbs.index(this);

    if ($photos.index($currentPhoto) == idx) return;

    $photos.stop(true);
    $currentPhoto.fadeOut({
      duration: 300,
      complete: _ => $photos.eq(idx).fadeIn(300),
    });

    let $currentThumb = getCurrentThumb();
    $currentThumb.removeClass('active');
    $(this).addClass('active');
  });
});


$(function() {
  var $thumbnails = $('#thumbnails img');
  var $figures = $('#full-size figure');

  $(document).click(function(event) {
    event.preventDefault();

    var $target = $(event.target);
    if ($target.is($thumbnails)) makeActive($thumbnails.index($target));
    if ($target.is('.arrow-left')) previous();
    if ($target.is('.arrow-right')) next();
  });

  $(document).keydown(function(event) {
    if (event.which === 37) previous();
    if (event.which === 39) next();
  });

  function previous() {
    var index = $thumbnails.index($('li.active img'));
    makeActive(index - 1);
  }

  function next() {
    var index = $thumbnails.index($('li.active img'));
    makeActive(index + 1);
  }

  function makeActive(index) {
    index = index % $thumbnails.length;
    $('figure.active, li.active').removeClass('active');
    $figures.eq(index).addClass('active');
    $thumbnails.eq(index).closest('li').addClass('active');
  }
});
