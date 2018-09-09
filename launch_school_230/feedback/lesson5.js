/*//==============================================================================//
//======================== jQuery Event Delegation =========================//
- code style issues (HTML and JS)
- tense (ex: "would")
- redo video
-----
- "all of the ways"
- "on jQuery's learning site"
-----
- video quality is very blurry and hard to read, even the HD version on a 2k monitor
- cut out minutes 8-12 of video, where he debugs something that's only relevant to his own system

//======================== Assignment: Managing Collections in JavaScript =========================//
- backticks
- code style
- redo video
- list item formatting
-----
- the first video and paragraph don't specify that there should be an internally stored collection of items -- it only talks about the surface level. it would be nice to know all the requirements before attempting the project (for students who do it on their own before looking ahead).
- "three text inputs, name, stock number, and quantity."
- rephrase: "the row of inputs for an item are not on the page, and that we've prepared a template (the `<script type="text/template" id="inventory_item">` element) that we can use to add them dynamically on the page later."
- "The purpose of the IIFE, together with the global inventory is to say"
- "after you save away the template string - we'll no longer need it. "
- "You'll see that the instructor use "
- not exactly the same functionality: "$.proxy(), which is the functional equivalent of JavaScript's built in bind method. "
- "built in bind method"
- ' "ADD ITEM" button'
- add colon: "button is clicked "
- " template string"
- " in the table element "
- "increment inventory object's "
- "after you complete this assignment, or need to get help."
- " above mentioned "
- " variables and or functions"
- "the current provided solution"
- " explore what could be a possible refactor."
- " while going through this project and reviewed"
-----
- yet again, he teaches more incorrect information in the video -- claiming that "returning false in a foreach callback tells it to stop running the loop..."
- `quantity` is a number to start with, but a string if updated
- use time element and datetime attribute
- template element instead of script

//======================== HTML Templating With JavaScript =========================//
- backticks!!! (it's very hard to read as-is without backticks)
- code style
- truthy/falsy instead of true/false
-----
- ' inline using style attributes'
- 'We would have quite a bit of code to write just to fill'
- ' two rows of 9 table '
- ' or at best a messy '
- 'nested each loops.'
- 'This is where the concept '
- ' Handlebars look like a property name'
- ' easy to use'
- ', or an empty array'
- ' passed in to'
- confusing: 'The each block takes the property name of an array on the object that is passed in to the Handlebars template and iterates over it. '
- 'property on it named "items",'

//======================== Practice Problems: Handlebars Basics =========================//
- this assignment and previous:
  - "x-handlebars" vs "x-handlebars-template"
  - line breaks in arrays: https://github.com/airbnb/javascript#arrays--bracket-newline
-----
- backticks
- code style
-----
- "download a copy of Handlebars from their homepage "
- "used to wrap each tag"

//======================== Assignment: Managing Collections in JavaScript with Handlebars =========================//
- this assignment uses `type="text/x-handlebars-template"` whereas the previous 2 leave out the `-template` part
- code style
- `/>`
-----
- `id` and `type` attributes are in opposite order as previous assignments
- cache `$('#inventory')`

//======================== AJAX Requests =========================//
- the new ES6 lesson isn't on the course outline page: https://launchschool.com/curriculum/courses/d78a8efe
-----
- backticks
- the jQuery ajax guide seems outdated (ex: `always` and `done` properties, (and maybe JSONP...?))
-----
- " Ajax is used much more often in modern websites "
- "work with cross-browser"

//======================== Project: Photo Gallery - Introduction and Server Setup =========================//
- code style
- ` />`
- all the HTML in `index.html` is aligned wrong (in index.html)
- jQuery and handlebars files aren't in `javascripts` folder (in index_v2.html)
- `index.html` missing `doctype` declaration
-----
- ' Gallery - Introduction'
- 'NPM'
- ' is located run'
- ' files - the'
- 'hidden every one'
- ' 3 Handlebars templates'
- 'in the end that '
- 'you'll use to dynamically render with server data, and insert into the document.'
- 'herewith'
-----
- no need for array in `comments.js`...: '`.split('').slice(2).join('')`'

//======================== Project: Photo Gallery, Part 1 - Fetch Data and Render on Page Load =========================//
- code style
- ' Part 1 - Fetch'
- "HTTP verb:" (x2+...)
- unnecessary return statement in `/photos/like` route in `photos.js`

//======================== Project: Photo Gallery, Part 2 - Slide Show  =========================//
- code style
- list item formatting
- backticks (ex: '500ms')
-----
- 'Part 2 - Slide '
- "If we're on the first photo and click previous, we loop to the last one. Same goes for clicking next on the last one "
- "When the slideshow is advanced, "
- ' from current to next'
- 'get to the previous or the next photo of the current photo.'
-----
- uses `each` to register partials, but there's only one partial in the HTML
- use `data('id')` instead of `attr('data-id')`
- `success` instead of `done`...?

//======================== Project: Photo Gallery, Part 3 - Like, Favorite and Comment =========================//
- code style
- list item formatting
- backticks
- redo (all) videos
- refactor entire solution
-----
- ' Part 3 - Like'
- actually they are anchors: '"Like" and "Favorite" buttons ' (x2+...)
- 'have the numbers incremented.'
- 'HTTP verb' (x2+...)
- 'returned with the new total.'
- ' the video on the bottom, up to 04:53.'
- ' form object '
- ' serialize the form input values as the data to send to the server.'
- ' form input values '
- 'comment, and '
- 'same data, with a date property.'
- 'If the email has a Gravatar associated with it, you'll get a Gravatar url back that you can use to render the comment. '
- ' get a Gravatar url back that'
- 'an example server response:'
- ' comments list using '
- neither the video nor the linked-to solution resets the form after submitting: 'Reset the form'
- 'Note1:', 'Note2:'
- ' in the video it is mentioned'
- 'the this context because '
- 'Using the on method with delegation of jQuery, this, would point to the selector element delegated to (in this case the a element).'
- 'The solution used in the video'
- 'on the json object'
- 'In the finished application's code that you can download, this is already addressed'
-----
- `$e` is confusing variable name (also `$el`)
- use `method` instead of `type`

//================================================================================//
//==============================================================================//*/
