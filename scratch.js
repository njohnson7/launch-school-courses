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

___

- " though; to find "
- `= <p class="intro" id="simple">‚Äö√Ñ¬∂</p>`
- " a String "
- no whitespace shown for value of text node `t`
- contradictory: "Elements don't have any textual content, so the nodeValue for Elements is null. We can use a different property when we need the text within an Element: textContent. ... textContent represents all the textual content of an Element."
- wrong amount of spaces in return value of `> document.querySelector("p").textContent` (and more)

*/


p(document.__proto__);
p(document.__proto__.__proto__);
p(document.__proto__.__proto__.__proto__);
p(document.__proto__.__proto__.__proto__.__proto__);

p(HTMLDocument.__proto__);
p(HTMLDocument.__proto__.__proto__);
p(HTMLDocument.__proto__.__proto__.__proto__);

body.querySelector('p')
<p class=​"intro" id=​"simple">​…​</p>​
a