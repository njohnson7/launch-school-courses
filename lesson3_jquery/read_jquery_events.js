$(function () {
  function setFavorite(fruit) {
    $p.text(`Your favorite fruit is ${fruit}`);
  }

  let $p = $('p');

  $('a').click(function (event) {
    event.preventDefault();
    setFavorite($(this).text());
  });

  $('form').submit(function (event) {
    event.preventDefault();
    setFavorite($(':text').val());
  });
});
