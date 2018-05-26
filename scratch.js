/*//==============================================================================//
//======================== 4: Tree Slicing =========================//
- HTML element alignment is off
- inconsisitent use of backticks in text
- periods after list items

___

- "inner most" (x2+...)
- "It's similar to slice but"
- "The end index"
- "the end index which is the inner most child node's id attribute. " ... "The end index doesn't have to be the id of the "inner most" child node as some of the examples suggest."
- "`sliceTree(2, 5)`"


//======================== 5: Coloring =========================//
- "only positive integers will be provided as arguments " -- (`0` is shown in the image)
- "Following are"
- "are some sample output"
- "`<title>Tracing the DOM Tree</title>`"
- "Node.children property"
- not necessary -- `parents` is already an array: "`var parentsArray = Array.prototype.slice.call(parents);`"


//======================== 6: Node Swap =========================//
- refactor `isInvalidSwap`
- refactor `isFirstNodeParentOfSecond`
- don't both nodes have to be siblings to be swapped (at least if going by examples)?
- refactor whole solution -- lots of repetitive/unnecessary code
- semicolon and also unecessary to pass these explicit values to `return`:
  - "`return undefined`"
  - "return true`"
- it's not specified anywhere in the requirements or test cases that `nodeSwap` should return `true`

___

- "swapped in to"
- "(see further exploration)"
- "The .replaceChild method"


//======================== 7: Nodes to Array =========================//
- trailing commas in arrays
- spacing in arrays

___

- "as it's content"
- "would be: ["BODY", [["div", []]]]."
- " set the value of the children array"


//======================== 8: Array to Nodes =========================//
- example2 input and output snippets are labelled backwards


//======================== 9: Work Back =========================//
- "that will result to the"
- 'Footer' should be in quotes: 'parentNode.tagName); = FOOTER'


//======================== 10: HTML Imaging =========================//
The reference solution doesn't take into account text nodes:

```
reference solution: (23) [document, <!DOCTYPE html>, html, head, text, title, text, text, style, text, text, text, body, text, header#header, text, h1.emphasis.light, text, text, p, text, text, text]
my solution:        (19) [document, <!DOCTYPE html>, html, head, text, title, text, text, style, text, text, body, text, header#header, h1.emphasis.light, text, p, text, text]
javascript:         (19) [document, <!DOCTYPE html>, html, head, text, title, text, text, style, text, text, text, body, text, header#header, h1.emphasis.light, text, p, text]
```

I'm not sure why mines slightly off too though... (see comments in submitted solutions for details)


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//


//======================== 1 - Exotic Animals =========================//
- periods after list items

___

- "animal containing"
- "Choose any pets/animals of your choice"
- "for an example"

//======================== 2 - Programming Languages Info =========================//
- "Further exploration"

//======================== 3 - A Custom Delete Confirmation Prompt =========================//
- list item periods
- fix first code snippet

___

- "from a JavaScript collection(array) of"
- "css based"

//======================== 5 - A Car Shop With Filtering =========================//
- "by make model, price and year of manufacture."
- "the following for each car"
- "the same price, mode,"
- "`price: 7000},`"


//======================== 6 - Adding Smart Select to Car Shop =========================//
- "all the rest of select boxes"

//======================== 7 - A JavaScript Stopwatch =========================//
- inconsistent use of periods at end of sentences
- inconsistent use of capital letters to start sentences

//======================== 8 - A JavaScript Calculator =========================//
- periods
- code style
- solution has errors, like being able to input more than one `-`, which leads to `NaN` results

___

- "calcuated"
- "shown. e.g."

//======================== 9 - A JavaScript WYSIWYG Editor =========================//
- listed controls aren't in same order as shown in solution
- refactor solution -- a lot of repetitive code

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
//======================== 1 - Form Validation, Part 1 =========================//
- list item periods
- email is also required: "First Name, Last Name, and Password are required fields and Phone is optional. "
- solution code style

___

- "text-field"
- "red colored"
- "the field. e.g "Password"
- "a required field"."
- "are corrected""
- "built in"
- "`$('form')[0]`"
- "Please Enter"


//======================== 2 - Form Validation, Part 2: Character Blocking Input =========================//
- the patterns for first name and last name are different from each other
- the patterns in the solution don't match the requirements
- how can first or last name be invalid when invalid characters are blocked?
- solution: code style / refactor

___

- "the pattern a-zA-Z\s'"
- "for First Name and last name."
- "Please Enter"

//======================== 3 - Automatic Tab Forwarding =========================//
- solution: code style / refactor
- no Discussion

//======================== 4 - Serializing Forms =========================//
- solution: code style / refactor

___

- "e.g."

//======================== 5 - Multiple Choice Quiz =========================//
- list item periods
- inconsistent use of quotes for integer property names in `answerKey`
- trailing commas in objects
- the title of the page in the solution is "Sign Up" instead of "Multiple Choice Quiz"
- solution: code style / refactor -- ex:
  - `showResult` method is empty...
  - `score` -- unused property
  - `one()`
  - `$(form)`
  - `self`
  - `reset()`

___

- "correct, wrong or"
- "the universe and everything?"
- "You didn not"


//==============================================================================//
//==============================================================================//
//==============================================================================//
//======================== Quiz 1 =========================//
- list item periods

___

- "Check all statements that describe what the DOM is?"
- "create a DOM"
- "when browser creates the"
- "When you view the source; you see"
- "as it was written and used as the input to create"
- "All codes represent"
- "Choice B represent an"
- "null"
- "Element nodes don't have values."
- "nodeValue. The two methods"
- "the use of the non-strict equality (==) coerced"
- "code results to an"
- "Walking the node"
- "Choice A is not a valid command"
- "Choice B and C works also"
- "test"/>"
- "calling cloneNode on the element with a class of .intro has a child"


//======================== Quiz 2 =========================//
- code style
- some code snippets are missing semicolons
- question 1 choice A should be correct

___

- "inside and event"
- "and, this"
- "argument of addEventListener method."
- "`// do something with record ... // do something with `data``"
- "Functions" (x2+...)
- "setTimeOut"
- "is loaded already, it's"
- "it's node can"
- "like there are more than one"
- "It's also likely to assume"
- "the css"


//======================== Quiz 3 =========================//
...... check screenshots .....


//======================== Quiz 4 =========================//
- missing periods
- code style -- ex:
  - "`var context= {`"


//======================== Quiz 5 =========================//
- some missing periods after choices
- some missing semicolons in code snippets

___

- ", the server responds with a the number"
- "It's counterpart"
- "using the XMLHttpRequest.setRequestHeader must"
- "following code, select t"
- "instead of responseType"
- "a cross-origin request?"
- "assigning id's to"
- "and it's scope is not"


//.................. feedback ...............//
Question 8 Option B is marked as correct, but it actually is not correct. Trying to access the `responseText` property on a request that has a `responseType` of `json` raises an `InvalidStateError`, as specified on [MDN](https://devdocs.io/dom/xmlhttprequest/responsetext):

> Exceptions

> InvalidStateError

> The `XMLHttpRequest.responseType` is not set to either the empty string or `"text"`. Since the responseText property is only valid for text content, any other value is an error condition.

Actual error in Chrome:

```
VM736:1 Uncaught DOMException: Failed to read the 'responseText' property from 'XMLHttpRequest': The value is only accessible if the object's 'responseType' is '' or 'text' (was 'json').
    at <anonymous>:1:9
```

Option C is the only correct answer.
//.................. /feedback ...............//


//============================ EVENTS EXERCISES ============================//
//======================== 1 - Randomizer =========================//
- solution outputs `1` even when no callbacks are passed


function, randomizer that
secods

//======================== 2 - Reverse Engineer =========================//


element#containter
checking if event.target element
- the `contains` method also returns true if its argument is the element itself, not just a child element: "checking if event.target element is a child of the element with an id of "container""
as child,


//======================== 3 - Bold Element + Custom =========================//
- the Further Exploration instructions are confusing in regards to the purpose of the `CustomEvent`

argumet
arugment



//======================== 4 - Buggy Code =========================//



image that nothing
a click on a link which intiaites visiting
intiaites



//================================================================================//
//==============================================================================//*/

