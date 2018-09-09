
let promise = new Promise(function (resolve, reject) {
  resolve(1);
});

promise.then(val => {
  p(val);                // 1
  return val + 2;
}).then(val => p(val));  // 3

promise
  .then(String).then(p)  // '1'
  .then(Array).then(p)   // ['1']

//============================================================================//

const get = url => (
  new Promise((resolve, reject) => {
    let req = new XMLHttpRequest;
    req.open('GET', url);
    req.onload  = _ => req.status == 200
      ? resolve(req.response)
      : reject(Error(req.statusText));
    req.onerror = _ => reject(Error('Network Error'));
    req.send();
  })
);

get('https://ls-230-web-store-demo.herokuapp.com/products').then(
  response => p('Success!', response),
  error    => console.error('Failed', error),
);

//============================================================================//

const getJSON = url => get(url).then(JSON.parse);

getJSON('story.json')
  .then(story => {
    addHtmlToPage(story.heading);
    return story.chapterUrls.reduce((sequence, chapterUrl) => (
      sequence
        .then(_ => getJSON(chapterUrl))
        .then(chapter => addHtmlToPage(chapter.html))
    ), Promise.resolve());
  }).then(_ => addTextToPage('All done'))
  .catch(error => addTextToPage(`Argh, broken: ${error.message}`))
  .then(_ => document.querySelector('.spinner').style.display = 'none');

//============================================================================//

getJSON('story.json')
  .then(story => {
    addHtmlToPage(story.heading);
    return Promise.all(story.chapterUrls.map(getJSON));
  }).then(chapters => {
    chapters.forEach(chapter => addHtmlToPage(chapter.html));
    addTextToPage("All done");
  }).catch(error => addTextToPage(`Argh, broken: ${error.message}`))
  .then(_ => document.querySelector('.spinner').style.display = 'none');

//============================================================================//

getJSON('story.json')
  .then(story => {
    addHtmlToPage(story.heading);
    return story.chapterUrls
      .map(getJSON)
      .reduce((sequence, chapterPromise) => (
        sequence
          .then(_ => chapterPromise)
          .then(chapter => addHtmlToPage(chapter.html))
    ), Promise.resolve());
  }).then(_ => addTextToPage('All done'))
  .catch(error => addTextToPage(`Argh, broken: ${error.message}`))
  .then(_ => document.querySelector('.spinner').style.display = 'none');

//============================================================================//


// With events (using simpler on* properties)
// A couple of functions to save repetiton
function handleError(err) {
  addTextToPage("Argh, broken: " + err.message);
  hideSpinner();
}

function hideSpinner() {
  document.querySelector('.spinner').style.display = 'none';
}

// In this example, we get an object we add load & error listeners to
var request = getJsonEvent('story.json');

request.onload = function() {
  addHtmlToPage(request.response.heading);

  // We need to track if anything failed
  var errored = false;
  // Track the next chapter that can appear on the page
  var nextChapterToAdd = 0;
  var chapterHtmls = [];


  // We store chapter requests so we can remove listeners later
  var chapterRequests = request.response.chapterUrls.map(function(chapterUrl, i) {
    var request = getJsonEvent(chapterUrl);

    request.onload = function() {
      // Store this chapter, we might not be able to deal with it yet
      chapterHtmls[i] = request.response.html;

      // Try and add new chapters to the page, in order.
      // Stop when we reach a chapter we've yet to download.
      for (; nextChapterToAdd in chapterHtmls; nextChapterToAdd++) {
        addHtmlToPage(chapterHtmls[nextChapterToAdd]);

        // Did we just add the final chapter?
        if (nextChapterToAdd == story.chapterUrls.length - 1) {
          addTextToPage("All done");
          hideSpinner();
        }
      }
    };

    request.onerror = function(event) {
      // prevent further events
      chapterRequests.forEach(function(request) {
        request.onload = null;
        request.onerror = null;
      });
      handleError(event.error);
    };

    return request;
  });
};

request.onerror = function(event) {
  handleError(event.error);
};

//============================================================================//

[1, 2, 3, 4, 5].reduce((arr, n) => (
  arr
    .concat(n * 2)
    .reverse()
), []);

//============================================================================//

const wait = ms => new Promise(resolve => setTimeout(resolve, ms));

wait().then(() => p(4));
Promise.resolve().then(() => p(2)).then(() => p(3));
p(1);  // 1, 2, 3, 4
