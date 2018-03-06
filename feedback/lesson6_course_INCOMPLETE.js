/*//==============================================================================//
//======================== Introduction =========================//
- ' will spend time writing code to provide the functionality required by a contemporary web application.'

//======================== What to Focus On =========================//
- 'cycle and the components of each part and how '
- ' and make requests using'
- 'data" and be able'
- ' you see and be able'
- ' URL, parameters, etc. needed '
- 'you move on'

//======================== HTTP Review =========================//
*** see HTTP feedback file ***

//======================== Book: Working with Web APIs =========================//
- assignment: 'work the examples'
- book: *** see apis book feedback file ***

//======================== Network Programming in JavaScript =========================//
- inconsistent capitalization of AJAX in this assignment vs. previous ones
-----
- 'retrieve all the HTML code at once from'
- 'when initiating ... write code that initiates'
- 'embedded form'

//======================== Making a Request with XMLHttpRequest =========================//
- 'a/an' before 'HTTP' is inconsistent throughout course
- add more pure JavaScript/DOM content to the course, instead of so much jQuery (especially using jQuery before really practicing much with pure DOM and ajax requests -- it's hard to see the problems jQuery solves without more experience without it first).
-----
- code style issues
- parens after function names in prose
- periods after table cells
- comment spacing
- the code in the codepen is a really indirect and confusing way to show how `XMLHttpRequest` works.
  - it could be refactored and shortened a lot to get the same point across, and would be much easier to read and understand.
  - using the same var name and id name (like `output`) is really confusing, since this var doesn't always point to the `#output` element.
  - `DOMAIN` references a URL, and `url` references a path
-----
- 'Use the XMLHttpRequest object to send a HTTP request with JavaScript.'
- 'This argument specifies whether the method should make a synchronous or asynchronous request.'
- 'most contemporary browsers deprecate them'
- 'omit it from most code.'
- `timeout` default value missing (in table)

//======================== XMLHttpRequest Events =========================//
- code style
-----
- also as `this`: 'the request is available as event.target'
- 'response-request cycle'
- rephrase: 'Whether the HTTP response-request cycle loads a complete response determines whether load or another event fires. It does not consider the response's semantic meaning to the application.'
- put info box before the codepen
- 'responsibility of application'
- 'readyState changes'
-----
- similar issues with Codepen as in previous assignment
- extra space: `buttonName).addEventListener('click',  requester(`

//======================== Data Serialization =========================//
- parens after function names in prose
- 'name/value ... Name-value' (x2+... in this and other assignments)
-----
- 'can be used both as'
- 'URL encoding also works with POST requests, but you must include a Content-Type header with a value of application/x-www-form-urlencoded when you do use it with POST.'
- 'It's a subset of JavaScript'
  - from wiki page: JSON was originally intended to be a subset of JavaScript, and is commonly used with Javascript, but it's a language independent data format.
  - also see MDN
- and `null`: 'exchange arrays, objects, strings, numbers, and boolean values.'
understand; strings,
- ' the Content-Type header has a value of application/json; charset=utf-8. This is required if you want to use JSON as the request serialization format. The server will not parse the request correctly if this header has the wrong value.'

//======================== Example: Loading HTML via XHR =========================//
- I think the course could be organized better: we spent so much time learning (mainly theory -- not practice) all the pure DOM and JS ways of interacting with web pages at the beginning of the course, and then moved on to using jQuery (for almost all the projects) before we even got much of a chance to get used to the DOM without the help of jQuery.
  - This whole time, I had been thinking that it must be pretty horrible to build web apps without jQuery, but after finally getting a chance to practice using them more in this lesson and the last, it's been a really enjoyable experience.
  - The heavy use of jQuery in most of this course made things really boring and uninteresting for me, because it does all of the work for you, and it restricts you to its conventions, instead of allowing you to branch out and learn a lot more by building things (like convenience functions) on your own.
  - I think it would be better to spend less time on jQuery, and also delay it until further back in the course.
  - That way it will have a bigger impact because it will give students a more personal understanding of the problems it solves, instead of just being told that jQuery is the best so just use it without question in any circumstance.
  - In other words, it would be much more interesting to learn about jQuery after spending more time manually doing the things it does for us.
  - This lesson has been the most enjoyable and interesting one by far in this course -- the APIs book was great, and so far the assignments are too! -- maybe the other lessons can be revamped, using this lesson as a guide.
-----
- code style
-----
- 'insert it in the div'
- use `this` or `event.target` instead of `request`: '`store.innerHTML = request.response;`'
- 'the DOM for initial page loads,'
- 'DOMContentLoaded handler request'
- 'the "page" is the right side of the CodePen dialog'
- 'dialog).'
- inconsistent style of error codes in assignments and APIs book (ex: ' 404 (Page Not Found) error')
- inconsistent use of `event` vs. `e` as callback param name in this vs. other assignments
- 'The form submits a POST request to http://s.codepen.io/products/1 and receives a 404 response'
- nested CSS selectors are used in the Codepen code

//======================== Example: Submitting a Form via XHR =========================//
- code style
-----
- '`// Or if there was no data to send`'
- ' to "POST",``'
- ' send().'
- 'name/value'
- '`Content-Length: 18`'
- 'The language (i.e., JavaScript)'
- 'The language (i.e., JavaScript) varies the specifics, but the basic structure and values will be the same.'
- 'Note that all parameter values are strings.'
- 'a HTTP'
- ' see the message You must be logged in to do that. when'
- move `event.preventDefault();` to top of event handler (x2)
- move `addEventListener` to before `send` (x2)
- 'The "You must be logged in to do that" message'

//======================== Example: Loading JSON via XHR =========================//
- code style
- comment spacing
-----
- 'In a previous assignment, we used the following code to load some JSON data from GitHub:
The valid values for responseType are: text, json, arraybuffer, blob, and document.
try/catch'
- highlight changed code in solution 2

//======================== Example: Sending JSON via XHR =========================//
- code style
-----
- first example doesn't work because missing `application/x-www-form-urlencoded` header
- '`Content-Length: 19`'
- there are lots of other bugs with the Web Store API documentation:
  - it says the parameters are `formData` and content-type is `application/x-www-form-urlencoded`, but the server only accepts json
  - none of the requests actually work when you click try it out and execute
  - the error message says "Must pass credentials in Authentication header.", but the header is actually "Authorization"
  - no where does it say that the value of this header is supposed to be "token AUTH_TOKEN"
  - almost all the code in the generated curl request is wrong
  - error at the bottom right: schemaValidationMessages  0 level "error" message "Can't read from file /v1/swagger_doc"
  - the body is a URL encoded string instead of json

//======================== Cross-Domain XMLHttpRequests with CORS =========================//
- code style
- parens after function names
-----
- 'our discussion here, ... say about it here.'
- 'policy; it prevents'
- 'All this script does is send an XHR GET request'
- 'All this script does is send ... and log'
- 'when it receives it.'
- 'the method getAreasOfContents()'

//======================== Project: Search Autocomplete, Part 1 - Introduction and Setup =========================//
- code style
  - use of single vs. double quotes in ruby files is inconsistent
  - some files don't end with a newline
  - extra newlines in some places
-----
- "Part 1 - Introduction"
- "Check this link"
- "Your focus for the server is on"
- "It is possible and likely, that"
- "as front-end developer"
- "that as front-end developer that you'll"
- "exposes you this"
- "scratch (the ground up)"
- "server is in Sinatra"
- "the work you've done"

//======================== Project: Search Autocomplete, Part 2 - Setting up the UI =========================//
- code style
  - second example Autocomplete is missing a semicolon
-----
- "Part 2 - Setting"
- "`href='/stylesheets/normalize.css' ... href='stylesheets/autocomplete.css'`"
- "erb template"
- "javascript"
- "index.erb references the javascript file /javascripts/autocomplete.js, let's add a file autocomplete.js to /public/javascripts."
- "set all of the initial state"
- "`//code omitted`"

//======================== Project: Search Autocomplete, Part 3 - Talking to the server =========================//
all autocomplete assignments:
- code style
- dash after "Part [#]"



//----------------------------------------------------------------------------//


=> TODO: feedback for parts 3-5 and summary!....................................
  - see phone screenshots for some


//================================================================================//
//==============================================================================//*/
