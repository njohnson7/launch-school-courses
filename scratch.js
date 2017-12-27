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

*/
//============================================================================//
//============================================================================//
