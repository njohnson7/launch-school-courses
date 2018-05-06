/* eslint-disable */
//============================================================================//
/*
//======================== A Hierarchy of Nodes =========================//
- " fundamental tenet "
- " permissiveness; they "
- " for text modes, "
- " (e.g. "DOM Level 1") "
- #4 diagram: "weelky"

//======================== Node properties =========================//
- double quoted strings
- inconsistent use of semicolons in code snippets
- backticks
-----
- " though; to find "
- `= <p class="intro" id="simple">‚Äö√Ñ¬∂</p>`
- " a String "
- no whitespace shown for value of text node `t`
- contradictory: "Elements don't have any textual content, so the nodeValue for Elements is null. We can use a different property when we need the text within an Element: textContent. ... textContent represents all the textual content of an Element."
- wrong amount of spaces in return value of `> document.querySelector("p").textContent` (and more)
- "of all the nodes inside Element"
- " joins the nodeValue"

//======================== Determining the Type of a Node =========================//
- inconsistent captialization of "Node"
- missing `=` sign in code snippets for return values ('<' is used instead - messes up syntax highlighting)
- double quoted strings
-----
- " at this writing, "
- `‚Äö√Ñ¬∂`pee.firstElementChild
- alternative methods: `({}).toString.call(a)`, `isPrototypeOf`, `getPrototypeOf` text h1 simple.intro

//======================== Element Attributes =========================//
- double quoted strings
- missing a lot of semicolons
- parens around method names in text
-----
- `‚Äö√Ñ¬∂` (x2+...)
- " String ", " Array "
- "You can do this, but it's tedious, and something you will need often."
- periods after `DOMTokenList` method descriptions

//======================== Traversing Elements =========================//
- this assignment and others:
  - maybe wrap "Text", "Element", etc. in backticks...?
  - capital vs. lowercase "Element", "String" etc...
  - maybe change `--` to emdash...?
- double quoted strings
- missing semicolons
- spaces after operators (ex: length-1, n+1, n-1)
-----
- `var i`, `i++`, `var node`, `var newText`
- snippet should show that whitespace has been removed as well: "The resulting page looks like this:"
- fix regex: `[a|p]`

//======================== Creating and Moving DOM Nodes =========================//
- parens around method names in text
- "Node"
- missing semicolons
- code snippet syntax highlighting
- double quoted strings
- `var`s at top
- `++`
-----
- " it's [has] changed "
- clarify word: "separate"
- emdash: " separate; changing "
- clarify: "Remove targetNode from parent.childNodes and insert node at its former position"

//======================== Summary =========================//
- ...check...

//======================== A Simple Example =========================//
- function keyword spacing
- `++`
- inconsistent use of `event` param
- colon: " events on addButton:"

//======================== Page Lifecycle Events =========================//
- function keyword spacing
-----
- "Since load event "

//======================== Adding Event Listeners  =========================//
- "Function"
- function keyword spacing
-----
- "focusses"
- accurate/rephrase...?: " they are merely interfaces: a collection of behaviors that do nothing until you override the behavior."

//======================== Capturing and Bubbling [old] =========================//
- function keyword spacing
- use of template literals without explanation (on this and previous assignment, and maybe future assignments)
- "Boolean"
- vars at top
- `++`
-----
- newline before: `return tag.toLowerCase();` (x2+...)
- wrong indentation: `tbody.appendChild(tr);` (x2+...)
- `display` function should be declared before regular code (x2+...)
- rephrase: " , though; in fact, it triggers it but once."
- comma: " d2 and "

//======================== Capturing and Bubbling (1) [new] =========================//
- not much explanation about the target phase
-----
- "added; in this case"
- "Innermost and Outermost Element"
- "The two event listeners have the same behavior for; they display"
- "on the other hand, are two and that's why the two alert boxes"
- "'click' event"
- "The event gets dispatched to each element twice, once during the capturing phase and once during the bubbling phase"
- "checks if there any listeners"
- "the third optional, argument, for the"
- "addEventLister"
- "the "click event""
- "`var divs = document.querySelectorAll('.pick');`"
- "`for(i = 0;`"

//======================== Capturing and Bubbling (2) [new] =========================//
- unnecessary use of quotes around a lot of words, like "click", "keypress", bubbling", "capturing"
- list item periods
-----
- Practice Problem 1: doesn't specify the event phase
- Practice Problem 2: "This problem demonstrates that the [click] event object passes through the capturing before the bubbling phase." -- it doesn't really demonstrate this because the result (the alerts) would appear to be identical either way
- Practice Problem 3: should be the target phase, not the "bubbling" phase
-----
- "short clip"
- "i.e."
- "the [click] event object"
- "alerts the code keyboard key"
- "this practice problem surfaces"

//======================== Preventing Propagation and Default Behaviors =========================//
- function keyword spacing
- comment spacing
- parens after function names in text
-----
- "It also ensures ~~that errors~~ that these methods run before any errors occur; "

//======================== Event Delegation =========================//
- Codepen failed to load the first time the page loaded (fixed by refreshing)
- function keyword spacing
- vars at top
- `++`
- double quoted strings
- "Elements"
-----
- " when the finishes loading."
- change to "We" for consistency: "You now "
- move to info box: "Keep in mind that you don't need to use document as the delegator: you can use any parent element of the elements you're watching to delegate events. You can even have more than one delegator element if it makes sense."

//======================== Assignment: Guessing Game =========================//
- Codepen didn't load again on first try (same as previous assignment)
- maybe alphebatize CSS (on this and other assignments)...?
- self closing tags have a slash -- inconsistent with other assignments
- wrap 1 and 100 in backticks
- function keyword spacing
- "Number" (maybe more...)
- parens after function names in text
- double quoted strings
- `++`
- change to explicit coercion: `guess`, `guesses` (x3+...)
-----
- remove comma: "submission, and"
- separate lines: `var answer, guesses;`
- make solution to 11 hidden

//======================== Assignment: Build an Input Box  =========================//
- function keyword spacing
-----
- empty CSS rule: `.text-field.focused .content {}`
- #2:
  - wouldn't the third event listener be better if nested inside the first...? (also #3...+?)
  - `event` arg is unused: `document.addEventListener('click', function(event) {` (x2+...?)
- #4:
  - picture shows spaces being entered, but solution doesn't allow spaces
  - maybe change to `+=`: `contentDiv.textContent = contentDiv.textContent `
- #5:
  - `which` is deprecated -- and why use both `which` and `key`...?
  - change to `slice`: `.substr(0, contentDiv.textContent.length - 1);`

//======================== Summary =========================//
- "Function"
- parens after method names
- capitalize event in...?: `event.preventDefault` (and others)

- " about what and where it happened."
- or: " and other devices."
- `which` is deprecated
- #9, #12: rephrase

//======================== Code Style =========================//
- "Function"
- function keyword spacing (TODO: also maybe add to 210 style guide...?)

- " this course slightly from " (addressed in previous feedback)
- " follow the code style from the Computational Thinking and JavaScript Programming course in your code."
  - rephrase, such as: "follow the style guide from [ (maybe...?) style guide assignment from later in 210]"
- " differences for [in] this course "
- wrap snake and camel case examples in backticks
- "variable names for ~~primitives and objects~~ [non-function objects] use snake case."
- change `// functions` to singular
- contraction: " it is snake case."
- declarations: "Formatting for Multiple Variable Definitions" (x2)
- "var statement" -- correct terminology?
- `// Drop the additional var ~~statements~~ [keywords]`

//======================== Douglas Crockford Lecture: The Metamorphosis of Ajax  =========================//

- "We now ask you "
- "The video has subtitles and closed captions, so feel free to use them."
- " later, and "
- active: "You're also encouraged "

//======================== Read: Introduction to jQuery =========================//
- " Javascript " (x2+...)
- function keyword spacing
- parens after function/method names
- comment spacing
- captilaization of comments
- "Object"
- missing trailing commas in object literals
- double quoted strings
- maybe wrap some "jQuery"s in backticks...? (ex: " directly attached to the jQuery object.")
-----
- " Web "
- " you will "
- " that you need,"
- confusing: "At its core, jQuery is a function that wraps a collection of DOM elements and some convenience methods into an object. You can call the function to select the elements you need to process, and manipulate the object or its elements with methods built into the object."
- confusing: "What is the jQuery function? Internally, it is a function that works with an argument that you pass to it. If the argument is a string or a DOM element, it wraps a collection of jQuery objects and returns them. If the argument is a function, jQuery uses that function as a callback when the document is ready."
- "AirBNB"
- fix singular/plural: "We often use the term setter method to refer to methods that set properties for an object. We also use the term getter method to refer to methods that retrieve the current values for a property. "
- not necessary for `px` (if value is a number, not string): " you must include the measurement units when appropriate."
- this line is a getter, previous is a setter: `console.log($content.width()); // now 400 (setter)`
- `css` can also use numeric values: "Note that width() and height() return and use numeric values, not string values like css() does."
- "For font-size, for example, "
- wrap in backticks...?: " the return value of jQuery"
- comment formatting: `console.log($lis.length);   // -> 3`
- " a bunch "

//======================== Demo: jQuery Overview =========================//
- video is pretty blurry -- can it be reuploaded in 1080p instead of 720?
- `/>` closing tags
- function keyword spacing
-----
- " videos and get "
- no `.even` class in actual HTML file
- video 6: value of radios is `'checked'`, not `'backend'`
- order: " setter and getter "
- " methods for calling jQuery methods "
- " start working more complex selectors."

//======================== Read: jQuery Events =========================//
- function keyword spacing
- parens after function names in text
- using `$e` for `$(this)` is confusing because `this` isn't an event...
- ` />`
- `event` instead of `e` for variable name...?
-----
- " with the event name as the first argument and the function to call when that event occurs."
- "if we click one of them"
- "write-in "
- better refactor might be to create a function that sets the text of the paragraph, such as: setFavorite = fruit => $p.text(\`Your favorite fruit is ${fruit}`);
- " all we need do "
- rephrase: "It's minor, but it's a useful refactoring that makes it easier to update and reuse. "
- remove or expand on: "Internally, jQuery uses the bind method and passes in the event name for you. "
  - might not be accurate looking at line 8281 of jquery321.js
-----
- Medium article:
  - not part of LS publication
  - some inaccuracies, such as: "we have attached a singular type of event, a click event, to our jQuery object, $p.", "logIt method ", and `this` binding / context
  - also some grammar and spelling mistakes

//======================== Read: jQuery DOM Traversal =========================//
- parens after function names in text
- missing some semicolons
- comment spacing
-----
- "In the last topic, "
- " There's two "
- " third of four "
- " as what are already "
- wrap: " the categories class "
- comma: "selector just"
- " and won't have "
- rephrase: " And if you needed all the siblings, rather than going out to the parent and looking back in for the siblings, we can simply use siblings() with an optional selector."
- change to "list items": `// Find all sibling lis and show them`

//======================== Practice Problems: Using jQuery Selectors  =========================//
- inconsistent use of nested single/double quotes
-----
- double quoted: " them with .addClass("highlight") to "
- "FInd "
- #6, #7: there are two list items that contain the text "ac ante"
- " an href that begins with #."
- backticks: " "off" "

//======================== Practice Problems: jQuery Events =========================//
- function keyword spacing
- the writing of the entire assignment is confusing -- not sure what is expected...
  - what is an "accordion"?
  - rewrite whole thing...?
- "Javascript" (x2+...)
- according to MDN `which` docs: "This feature has been removed from the Web standards. Though some browsers may still support it, it is in the process of being dropped. Avoid using it and update existing code if possible; see the compatibility table at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time." (also applies to other assignments)
- parens after function names in prose
- wrap some words in backticks, such as " submit event,"(x2+...) and " the which property " and "click event"
- fix code style on completed assignment page and video
  - function keyword spacing
  - double quotes
  - camel case
  - combined var declarations
  - unnecessary var declaration of `character`
  - if statement
-----
- the anchor doesn't trigger a key press event -- it's the other way around in the assignmnet: "There will also be an anchor that will trigger the key press when it is clicked on."
- " below that to be used "
- " accordion, then "
- " entered in to "
- " is to be able to "
- comma: " and if so stop "
- " since the key that was pressed was not the one we were looking for."
- " call e.preventDefault(); "
- " call trigger("click") "

//======================== Assignment: Arithmetic Calculator =========================//
- inconsistent periods in list
- videos in this assignment and the last spend way too much time talking about CSS
-----
- rephrase: "The basics of the program will be to set the current operator to a variable, a series of conditional statements that perform a different action on the two values based on the current operator, then output the result to a container."
- inconsistent: "two text inputs" vs. "Two HTML number inputs "
- "the two numbers to operate with "
- " store them as variables "
- backticks: "Create if statements", " NaN ", "1", "11"
- "Create if statements to check the operator, and perform a different calculation for each "
- " They are read in as strings, so if you add them together, for example "1" and "1", your result will be "11"."
- video:
  - unary plus operator for number conversion
  - var declarations
  - double quotes
  - function keyword spacing

//======================== Assignment: Removing jQuery =========================//
- all the assignments/videos/etc authored by Shane are very hard to maintain interest in, often contain inaccurate information, use non-conforming code style, do things in non-idiomatic/best-practice ways, and are often confusing and difficult to understand -- this is in stark contrast to the rest of LS material, so it would be great if they were all redone.
-----
- property/method not event: "The window.onload event," (x2+...)
- double quoted strings in prose and code
- backticks (x10+...)
- function keyword spacing
- snake case
- there's no need to add IDs to everything...
- same style issues in completed assignment code and video
- use `DOMContentReady` instead of `load`
- in this and previous assignment: convert `result` to string before assigning
-----
- "With the DOM methods we've learned, we can see similarities between those and jQuery methods. "
- not accurate: "The window.onload event, for example, works like the jQuery DOM ready event $(document).ready"
- " jQuery script include."
- "Begin with the DOM ready function"
- "getElementById. "
- " aliases to "
- inaccurate: "Most events in jQuery are aliases to JavaScript DOM methods, with the only difference being the addition of "on" in front of the event name. jQuery's load event becomes onload, click becomes onclick, and submit becomes onsubmit."
- "handlers see its "
- colon: `// The JavaScript equivalent`
- use querySelector: `document.getElementById("calculator")`
- it's already used by chrome/firefox: " the $ variable name is free to be used "
- jQuery's syntax is much more like querySelectorAll, not getElementById: "Which will allow us to modify our code above to something much more similar to jQuery's syntax."
  - also add a colon
- "a jQuery input object,"
- ".value property"
- "you'll see more instances of how jQuery is performing its tasks by using JavaScript and presenting you with a nicer interface to use."
- period/colon: "Here is a video walkthrough of the assignment"
- video:
  - "onsubmit event" is not an event

//======================== Assignment: Grocery List =========================//
- too much focus on CSS in this and other assignments
-----
- periods after list items (steps)
- backticks around element names, function names, var names, event names, numbers, (ex: get method x2+...) etc.
- `/>`
- double quoted strings
- combo var declarations
- function keyword spacing
- why use $f.find in this and other assignments when id is only going to be used once on a given page...?
-----
- " and quantity"
- "all of your"
- you'd vs you could: "you could pass a value of -1 to the get method. To get the second to last, you'd pass -2."
- colon: "Here is a video walkthrough of the assignment"
- use `this.reset` instead of $f.get(0).reset(): "To get at the DOM element from a jQuery object, there are ~~two~~ methods. "
- $f var not really necessary...
- $ul var not necessary
- add period and rephrase: " view our grocery list"

//======================== Assignment: DOM Shuffling =========================//
- function keyword spacing
- double quoted strings
- var declarations
-----
- "Refresh your page as you go; when an element is in the right spot, it will have a light green background, and when wrong it will have a red background."

//======================== Assignment: Team Member Profile Modals =========================//
- too much focus on css in this and other assignments
- backticks
- the whitespace reset file is not even loaded anywhere
- "you" vs "we"
- using `e` for event and `$e` for element is confusing
- the css file linked doesn't include responsive design styles
-----
- `margin-left: -200px`
- "user's"
- " page they won't"
- "you can also": "You can also experiment with animating the element in from one of the sides of the screen. You can also"
- periods after list items in prose

//======================== Assignment: Photo Gallery Slideshow =========================//
- written instructions are kind of confusing without using the video and/or completed page as a guide
  - in this and other assignments, the instructions could be rewritten to improve readability -- I keep reading the same sentences/paragraphs multiple times without comprehending it or being able to move forward, even after completing the assignment and watching the video. When I read the jQuery or CSS docs, I have no trouble at all, so I'm pretty sure the problem is the writing style of these assignments (other LS assignments, like in course 210, are much better written).
- backticks
- mostly the same code style issues as other assignments (run eslint to see (23 errors))
- inconsistent use of `/>` at end of self closing tags between different assignments
- completed photo gallery is buggy if you click too fast on the thumbnails
  - clicking on same thumbnail probably should do nothing
  - clicking on other thumbnails too fast causes more than one image to be visible at once
  - sometimes more than one large photo will appear at the same time (vertically stacked)
  - in the video he says he uses `stop()` to avoid side effects when clicking a lot, but in the completed assignment, there are side effects like the above
-----
- " of reach "
- "hammer we "
- "that was worked on"
- "On the first thumbnail, we will have a class added that will designate it as the currently visible image in the slideshow."
- "before animating them"
- "elements' opacity value"
- " container so they sit "
- "slidehsow"
- "slide and figure"
- there's only one version in the video, and it doesn't include the forwar/backward controls: "Check out a walkthrough of the basic and extra credit versions of the assignment."
- the completed assignment also doesn't have the controls
- "You can see an example that we have completed using placeholder images."

//======================== Assignment: Refactoring =========================//
- double quoted strings
- dots before method names
- parens after method names
- periods after list items
- function keyword spacing
- comma-dangle
- brace style for `if else`
- `==`
- `+` for type coercion
- `+ ''` for type coercion
- `++`
- vars at top
- combo var declarations
- newlines after block closing braces
- backticks -- ex: "css method call", "addClass and removeClass call", index file, etc
- var names snake case
- the given solution could be refactored much more
- rephrase almost everything to make the writing more understandable
- quote-props
- the refactored solution has over 100 Airbnb style guide violations according to ESLint
-----
- "From making your code more efficient to more intention-revealing, "
- " more function calls means "
- "hovered to"
- "read more link "
- "article content "
- rephrase all of the list items: "Our goal with each of these areas is as follows:"
- `len = ccNum.length;`
- there are two calls: "css method call"
- the click event handler for the birthstones ("ul a") also gets executed when clicking on a nav link
  - ex: when you click on Home or a submenu link, the message at the bottom says: "Your birthstone is undefined"
- "your credit card number code "
- unnecessary to have 2 different `total`s (even and odd) if only adding them together
  - code and "Pull your credit card number code out into a function that can be called to obtain the sum of the odd and even digits"
- only two click events were combined in the video, not all of them like this implies: "Combine the click events into one since they share functionality, avoiding repeated code "
- " scenario that "
- "As an added practice,"
- " and other cases "
- the solution has more than one call still: "Eliminate all but one of the text method calls in your code."
- getLuhnTotal function is unncessarily very convoluted and hard to understand
  - it also should be declared higher up
- the buttons/links say "Toggle me" but they can't be toggled back and forth -- they only have an effect once.
*/
//============================================================================//
//============================================================================//
/* eslint-enable */
