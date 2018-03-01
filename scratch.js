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

___

- 'can be used both as'
- 'URL encoding also works with POST requests, but you must include a Content-Type header with a value of application/x-www-form-urlencoded when you do use it with POST.'
- 'It's a subset of JavaScript'
  - from wiki page: JSON was originally intended to be a subset of JavaScript, and is commonly used with Javascript, but it's a language independent data format.
  - also see MDN
- and `null`: 'exchange arrays, objects, strings, numbers, and boolean values.'
understand; strings,
- ' the Content-Type header has a value of application/json; charset=utf-8. This is required if you want to use JSON as the request serialization format. The server will not parse the request correctly if this header has the wrong value.'

//======================== Example: Loading HTML via XHR =========================//
- code style


 insert it in the div
- use `this` or `event.target` instead of `request`: '`store.innerHTML = request.response;`'
 the DOM for initial page loads,
DOMContentLoaded handler request
 the "page" is the right side of the CodePen dialog
dialog).





//================================================================================//
//==============================================================================//*/


