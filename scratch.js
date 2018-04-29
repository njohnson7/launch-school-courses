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


//======================== 1: Exotic Animals =========================//
- periods after list items

animal containing
Choose any pets/animals of your choice
for an example

//======================== 2: Programming Languages Info =========================//


//================================================================================//
//==============================================================================//*/
