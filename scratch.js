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

- remove comma: "submission, and"
- separate lines: `var answer, guesses;`
- make solution to 11 hidden



*/
//============================================================================//
//============================================================================//

