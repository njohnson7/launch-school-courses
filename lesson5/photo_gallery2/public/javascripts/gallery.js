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
  $('main > h1').html(`Amanda Rose's Photos &mdash; ${id}`);
};








// TODO:
//   - remove calls to `_*` functions
//   - fix alignment of `ajax` chained method calls
//   - oranize everything into a `slideShow` object...?


$(function () {
  const $slides       = $('#slides');
  const $prevNext     = $('.prev, .next');
  const $header       = $('section > header');
  const $commentsList = $('#comments ul');
  const $commentsForm = $('#comments form');

  // TODO: combine these into a loop
  const photosTemplate     = Handlebars.compile($('#photos').html());
  const photosInfoTemplate = Handlebars.compile($('#photo_information').html());
  const commentsTemplate   = Handlebars.compile($('#comments_template').html());
  Handlebars.registerPartial('comment', Handlebars.compile($('#comment').html()));

  let photos;

  const $getCurrentPhoto   = _  => $slides.children().first();
  const $getLastPhoto      = _  => $slides.children().last();
  const getCurrentPhotoId  = _  => $getCurrentPhoto().data('id');
  const getCurrentPhotoObj = id => photos.find(photo => photo.id == id);

  const renderPhotoInfo = function () {
    let id               = getCurrentPhotoId();
    let currentPhotoObj  = getCurrentPhotoObj(id);
    $header.html(photosInfoTemplate(currentPhotoObj));
    _showPhotoId();
  };

  const renderComments = function () {
    let id = getCurrentPhotoId();
    $.ajax('/comments', {
      data:     { photo_id: id },
      dataType: 'json',                // TODO: remove (all) `dataType` properties...?
    }).done(function (comments) {
      $commentsList.html(commentsTemplate({ comments }));
      $commentsForm.find('input:hidden').val(id);
    });
  };

  const changePhoto = function (e) {
    e.preventDefault();
    // TODO: fade in/out at the same time; use jQuery's `prev/next` methods...?; store `300` in a var
    $getCurrentPhoto().stop().fadeOut(300, function () {
      $(e.target).hasClass('prev')
        ? $getLastPhoto().prependTo($slides)
        : $(this).appendTo($slides);
      $getCurrentPhoto().fadeIn(300);
      renderPhotoInfo();
      renderComments();
    });
  };

  $.ajax('/photos', {
    dataType: 'json'
  }).done(function (photosJson) {
    photos = photosJson;
    $slides.append(photosTemplate({ photos }));
    $prevNext.click(changePhoto);
    renderPhotoInfo();
    renderComments();
  }, _logDoneInfo);

  $('section > header').on('click', 'a.button', function (e) {
    e.preventDefault();
    let id         = getCurrentPhotoId();
    let buttonType = this.classList[1];

    $.ajax(`/photos/${buttonType}`, {    // TODO: change to this.attr(href)
      method:   'POST',
      data:     { photo_id: id },
      dataType: 'json',
    }).done(function ({ total }) {
      getCurrentPhotoObj(id)[`${buttonType}s`] = total;
      renderPhotoInfo();    // TODO: render just the new numbers, not all the info
    });
  });

  $commentsForm.submit(function (e) {
    e.preventDefault();
    $.ajax('/comments/new', {    // TODO: change to form.action and form.method
      method:   'POST',
      data:     $commentsForm.serialize(),     // TODO: change to `this`...?
      dataType: 'json',
    }).done(renderComments, this.reset.bind(this));    // TODO: render just the new comment, not all of them
  });
});
