











const $articles = $('article')
const $a        = $('a')

const switchPage = id => {
  $a.removeClass('active')
  $a.find(a => a.href == id).addClass('active')
  $articles.hide().filter(id).show()
}

$a.click(function (ev) {
  ev.preventDefault()
  let $clickedA = $(this)
  let id        = $clickedA.attr('href')
  switchPage(id)
  history.pushState({ id }, $clickedA.text(), id)
})

$(window).on(`popstate`, function (ev) {
  let state = ev.originalEvent.state
  switchPage(state ? state.id : '#page_1')
})
