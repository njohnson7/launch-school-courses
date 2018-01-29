//============================================================================//
//======================== 1 =========================//


$(function () {
  let $labels = $('label');
  $labels.click(function (e) {
    let $label    = $(this);
    let $checkbox = $label.find('input');
    let category  = $label.data('category');
    let $games    = $('.games li').filter(`[data-category='${category}']`);
    let show      = $checkbox.is(':checked');
    $games.toggle(show);
  });
});


//============================================================================//
//======================== 2 =========================//


$(function () {
  $(':checkbox').change(function () {
    let $checkbox = $(this);
    let category  = $checkbox.data('category');
    let $games    = $('.games li').filter(`[data-category='${category}']`);
    $games.toggle();
  });
});


//============================================================================//
//======================== 3 =========================//


const CATEGORIES = {
  'Nintendo 3DS':  [1, 2],
  'Nintendo WiiU': [3, 4],
  'PlayStation 4': [6, 7, 9],
  'Xbox One':      [5, 8, 10],
};

$(function () {
  $(':checkbox').change(function () {
    let $checkbox   = $(this);
    let categoryIds = CATEGORIES[$checkbox.val()];
    $('.games li').filter(function () {
      return categoryIds.includes($(this).data('id'));
    }).toggle($checkbox.is(':checked'));
  });
});


//============================================================================//
//======================== 4 =========================//


const ITEMS = [{
  title:    'The Legend of Zelda: Majora\'s Mask 3D',
  id:       1,
  category: 'Nintendo 3DS',
}, {
  title:    'Super Smash Bros.',
  id:       2,
  category: 'Nintendo 3DS',
}, {
  title:    'Super Smash Bros.',
  id:       3,
  category: 'Nintendo WiiU',
}, {
  title:    'LEGO Batman 3: Beyond Gotham',
  id:       4,
  category: 'Nintendo WiiU',
}, {
  title:    'LEGO Batman 3: Beyond Gotham',
  id:       5,
  category: 'Xbox One',
}, {
  title:    'LEGO Batman 3: Beyond Gotham',
  id:       6,
  category: 'PlayStation 4',
}, {
  title:    'Far Cry 4',
  id:       7,
  category: 'PlayStation 4',
}, {
  title:    'Far Cry 4',
  id:       8,
  category: 'Xbox One',
}, {
  title:    'Call of Duty: Advanced Warfare',
  id:       9,
  category: 'PlayStation 4',
}, {
  title:    'Call of Duty: Advanced Warfare',
  id:       10,
  category: 'Xbox One',
}];

$(function () {
  $(':checkbox').change(function () {
    let $checkbox = $(this);
    let checked   = $checkbox.is(':checked');
    let category  = $checkbox.val();
    let ids       = ITEMS.filter(item => item.category == category).map(item => item.id);
    $('.games li').filter((_, li) => ids.includes($(li).data('id'))).toggle(checked);
  });
});


//============================================================================//
//======================== 5 =========================//


$(function () {
  $(':checkbox').change(function () {
    let category = $(this).val();
    $(`.games li:contains(${category})`).toggle();
  });
});


//============================================================================//
//======================== 6 =========================//


$(function () {
  $(':checkbox').change(e => $(`.games li:contains(${$(e.target).val()})`).toggle());
});


//============================================================================//
//======================== 7 =========================//


$(_ => $(':checkbox').change(e => $(`.games li:contains(${$(e.target).val()})`).toggle()));
