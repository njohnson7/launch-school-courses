document.addEventListener('DOMContentLoaded', function () {
  let frameLength = 13;
  let speed       = 800;
  let steps       = Math.ceil(speed / frameLength);  // 31
  let endTop      = 250;
  let endLeft     = 500;
  let par         = document.querySelector('p');
  let i           = 0;

  function update() {
    par.style.top  = `${endTop  * (i / steps)}px`;
    par.style.left = `${endLeft * (i / steps)}px`;
    ++i < steps && setTimeout(update, frameLength);
  }

  // update();
});

//============================================================================//


$(function () {
  let $p = $('p');
  // $p.fadeOut();
  // $p.fadeIn();
  // $p.fadeToggle();
  // $p.fadeToggle();
  // $p.fadeTo(400, .5);

  // $p.fadeOut('slow', function () {
  //   $(this).fadeIn('slow');
  // });

//========================  =========================//

  // $p.slideUp();
  // $p.slideDown();
  // $p.slideToggle({
  //   duration: 800,
  //   easing:   'linear',
  //   complete: _ => p('sliding complete'),
  //   queue:    false,
  // });

//========================  =========================//

  // $p.animate(
  //   { left: 500, top: 250 },
  //   800,
  //   'swing',
  //   function () {
  //     // p('all done');
  //     $(this).text('All done!');
  //   }
  // );

//========================  =========================//

// $.fx.off = true;

  $p.animate({
    left:    500,
    top:     250,
    opacity: .5,
    height: 900,
    width: 200,
  }, {
    duration: 1000,
    complete() {
      $(this).after('<div style="color: red">All done!</div><br>');
    },
    step(now, fx)  {
      let data = `${fx.elem.id} ${fx.prop}: ${now}`;
      $('body').append(`<div>${data}</div>`);
      // if (now == 500) p(fx);
    },
  });
});
