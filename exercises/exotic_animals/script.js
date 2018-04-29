















// document.addEventListener('DOMContentLoaded', _ => {

// let timeout;

// const hover = e => {
//   let img = e.currentTarget;
//   timeout = setTimeout(_ => showCaption(img), 1300);
// };

// let imgs = document.querySelectorAll('img');
// p(imgs);

// imgs.forEach(img => {
//   img.addEventListener(mouseHover);
//   img.addEventListener(mouseLeave);
// });


// });





let timeout;
// let interval;

const isNotImg   = elem => elem.tagName != 'IMG';
const getCaption = img => img.nextElementSibling;

const fadeIn = elem => {
  // clearInterval(interval);
  let interval = setInterval(_ => {
    elem.style.opacity == 1
      ? clearInterval(interval)
      : elem.style.opacity = +elem.style.opacity + .1;
  }, 25);
};

const fadeOut = elem => {
  // clearInterval(interval);
  let interval = setInterval(_ => {
    elem.style.opacity == 0
      ? clearInterval(interval)
      : elem.style.opacity = +elem.style.opacity - .1;
  }, 50);
};

const showCaption = img => {
  fadeIn(getCaption(img));
};

const hideCaption = img => {
  fadeOut(getCaption(img));
};

document.addEventListener('mouseover', e => {
  let img = e.target;
  if (isNotImg(img)) return;

  timeout = setTimeout(_ => showCaption(img), 2000);
});

document.addEventListener('mouseout', e => {
  p(e.target)
  let img = e.target;
  if (isNotImg(img)) return;

  if (timeout) clearTimeout(timeout);
  hideCaption(img);
});
