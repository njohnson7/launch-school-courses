const _STYLE = 'color: #33b5e5; background: #000; padding: 4px 7px 4px 0; font-weight: bold;';
const _logDoneInfo = function (data, textStatus, jqXHR) {
  pt(data);
  p('%c data:',   _STYLE, data);
  p('%c status:', _STYLE, textStatus);
  p('%c jqXHR:',  _STYLE, jqXHR);
  p('%c this:',   _STYLE, this);
};

const _showPhotoId = function () {
  let id = $('#slides').children().first().data('id');
  $('h1').html(`Amanda Rose's Photos &mdash; ${id}`);
};










$(function () {
  const $slides = $('#slides');
  const $prev   = $('.prev');
  const $next   = $('.next');

  const photosTemplate     = Handlebars.compile($('#photos').html());
  const photosInfoTemplate = Handlebars.compile($('#photo_information').html());

  $.ajax({
    url:      '/photos',
    method:   'GET',
    dataType: 'json',
  }).done(_logDoneInfo)
    .done(function (photos) {
      p(photosTemplate({photos}));
      $slides.append(photosTemplate({ photos }));
  });

  $prev.click(function (e) {
    e.preventDefault();
    $slides.children().last().prependTo($slides);
    _showPhotoId();
  });

  $next.click(function (e) {
    e.preventDefault();
    $slides.children().first().appendTo($slides);
    _showPhotoId();
  });
});
