















  $(window).on("popstate", function(e) {
    var state = e.originalEvent.state;
    e.p
    // switchPage(state === null ? "#page_1" : state.idx);
  });


let $articles = $('article')
let $a        = $('a')

$a.click(function (ev) {
  ev.preventDefault()

  $a.removeClass('active')
  let $clickedA = $(this)
  $clickedA.addClass('active')

  let id = $clickedA.attr('href')
  $articles.hide().filter(id).show()
  history.pushState({ id }, $clickedA.text(), id)
})
