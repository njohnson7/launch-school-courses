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
-----
- " though; to find "
- `= <p class="intro" id="simple">‚Äö√Ñ¬∂</p>`
- " a String "
- no whitespace shown for value of text node `t`
- contradictory: "Elements don't have any textual content, so the nodeValue for Elements is null. We can use a different property when we need the text within an Element: textContent. ... textContent represents all the textual content of an Element."
- wrong amount of spaces in return value of `> document.querySelector("p").textContent` (and more)

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

//======================== Capturing and Bubbling =========================//
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

- " videos and get "
- no `.even` class in actual HTML file

*/
//============================================================================//
//============================================================================//

// array=(a=0,b=1)=>[...Array(39)].map(_=>([a,b]=[b,a+b],a%10))
t