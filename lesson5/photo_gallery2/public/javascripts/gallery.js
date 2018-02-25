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










$(function () {
  const $slides       = $('#slides');
  const $prevNext     = $('.prev, .next');
  const $header       = $('header');
  const $commentsList = $('#comments ul');

  const photosTemplate     = Handlebars.compile($('#photos').html());
  const photosInfoTemplate = Handlebars.compile($('#photo_information').html());
  const commentsTemplate   = Handlebars.compile($('#comments_template').html());
  Handlebars.registerPartial('comment', Handlebars.compile($('#comment').html()));

  let photos;
  // let comments;

  const $getCurrentPhoto   = _ => $slides.children().first();
  const $getLastPhoto      = _ => $slides.children().last();
  const getCurrentPhotoId  = _ => $getCurrentPhoto().data('id');
  const getCurrentPhotoObj = (id) => photos.find(photo => photo.id == id);

  const renderPhotoInfo = function () {
    let id               = getCurrentPhotoId();
    let currentPhotoObj  = getCurrentPhotoObj(id);
    $header.html(photosInfoTemplate(currentPhotoObj));
    _showPhotoId();
  };

  const renderComments = function () {
    let id = getCurrentPhotoId();
    $.ajax(`/comments?photo_id=${id}`, { dataType: 'json' })
      .done(_logDoneInfo)
      .done(function (comments) {
        $commentsList.html(commentsTemplate({ comments }));
      });
  };

  const changePhoto = function (e) {
    e.preventDefault();
    $getCurrentPhoto().stop().fadeOut(300, function () {
      $(e.target).hasClass('prev')
        ? $getLastPhoto().prependTo($slides)
        : $(this).appendTo($slides);
      $getCurrentPhoto().fadeIn(300);
      renderPhotoInfo();
      renderComments();
    });
  };

  $.ajax('/photos', { dataType: 'json' })
    // .done(_logDoneInfo)
    .done(function (photosJson) {
      photos = photosJson;
      $slides.append(photosTemplate({ photos }));
      $prevNext.click(changePhoto);
      renderPhotoInfo();
      renderComments();

      $('.actions > a').click(function (e) {
        e.preventDefault();
        // $.ajax('/photos/favorite', { method: 'POST' });
        // let currentPhoto = $getCurrentPhoto();
        p(this);
        let id       = getCurrentPhotoId();
        let photoObj = getCurrentPhotoObj(id);
        if (e.target.hasClass('favorite'))   photoObj.favorites++;
        else if (e.target.hasClass('likes')) photoObj.likes++;
        renderPhotoInfo();
      });

    });

 // $('.favorite').click(function (e) { e.preventDefault(), p(42) });


});
