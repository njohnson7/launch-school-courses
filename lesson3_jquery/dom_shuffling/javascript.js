// $(function () {
//   $('main').before($('header').last());
//   $('nav').before($('h1').first());
//   $('figure').first().before($('figure').last());
//   $('figure').first().append($('figcaption').last());
//   $('figure').last().append($('figcaption').first());
//   $('article').append($('figure'));
// });

$(function() {
  (function fixHeader() {
    var $header = $("body > header");

    $header.prependTo(document.body);
    $("main > h1").prependTo($header);
  })();

  (function fixFigures() {
    var $figures = $("figure"),
        $img = $figures.eq(0).find("img").remove();

    $figures.appendTo("article");
    $figures.find("img").insertBefore($figures.eq(0).find("figcaption"));
    $figures.eq(-1).find("figcaption").before($img);
  })();
});
