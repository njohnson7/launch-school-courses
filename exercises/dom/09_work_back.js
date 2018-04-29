

















document.addEventListener('DOMContentLoaded', function () {
//============================================================================//



pe(document.head.childNodes.length, 3);
pe(document.head.children[0].tagName, 'TITLE');
pe(document.head.textContent,
`
      Title
    `
);

pe(document.body.children.length, 3);
pe(document.body.childNodes.length, 5);
pe(document.querySelector('div').parentNode.parentNode.tagName, 'BODY');
pe(document.querySelector('div section').children[2].nextElementSibling, null);
pe(document.querySelectorAll('div').length, 1);

let nodeA = document.body.firstElementChild;
pe(document.querySelector('footer').children.length, 1);
pe(document.querySelector('body').replaceChild(
  document.querySelector('footer'), document.body.firstElementChild).tagName,
'HEADER');

pe(document.body.appendChild(nodeA).tagName, 'HEADER');

pe(document.querySelector('section').textContent.split('\n')
   .map   (text => text.trim())
   .filter(text => text.length > 0),
['H1', 'Hello', 'World']);

p(document.querySelector('section').children);  // HTMLCollection(3) [h1, p, p]);
pe(document.querySelector('section').textContent,
`
            H1
            Hello
            World
          `
);

pe(document.querySelector('span.emphasis').parentNode.tagName, 'FOOTER');



//============================================================================//
});
