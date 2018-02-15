/* eslint-disable */
/*//==============================================================================//
//======================== Random =========================//
- Suggestion for rephrasing the paragraph at the beginning of the [Community Forum page](https://launchschool.com/forum):
  - > Please use the community forum for all non ***~~course related~~ [course-related]*** topics! If you have a ***~~course related~~ [course-related]*** question, use ***~~lesson discussions in the course~~ [one of the "Discussions" forums that are in each lesson of every course]***.

//======================== Introduction =========================//
- " learned the jQuery library"
- " get in to"
- "array and object iteration"

//========================  Read: jQuery Animations =========================//
- dots and parens in method names in prose
- `++`
- snake case
- keyword-spacing
- `$p` is not a jQuery object
- backticks
- comma-dangle
-----
- is this accurate?: "We used a couple of these effects methods in the first front-end development course. "
- "we can then write "
- " until the next frame equal to the frame length until "
- " All the while, "
- `// `p` has "position: absolute" for this snippet`
- "new-found "
- " get in to"
- "milliseconds,"
- " another could "

//======================== Assignment: Animating a Cartoon Strip =========================//
- backticks -- ex: "for loop", each, blind, div, speed, delay, top, height, 0, animate, etc (in this and other assignments)
- function keyword-spacing
- dots and parens in function names in prose
- double quoted strings
- no link to completed version
- comment spacing
- same code style issues as last videos
-----
- "all of these"
- "The delay method will need to increase by an additional 1500 with each element, since they have to wait for all previous elements to animate and delay to the next one. We can use the index variable to multiply the delay by, then add the speed to it. T"
- "This method works like a for loop, but gets rid of a lot of the code. "
- why not just use the second argument or `this`, instead of: "so we can use that to grab the specific element from the collection by using the .eq() method on the collection and passing in the index."
- " The argument you receive in the callback is the index of the element, so we can use that to grab the specific element from the collection by using the .eq() method on the collection and passing in the index."
- not covered yet: "try adding data attributes "
- "of the assignment overview and walkthrough of the HTML and CSS creation."
- "Next, we walk through the JavaScript that will animate each blind out in sequence."
- "add a link in to"
- "then the dialog would start to appear"
- "explain why and how "
- capital: " "start over" " (x2+...)
- " finished, so 2 "
- "different value of i"
- rephrase: "When we click "start over" when the dialog is loaded half way, the previous startAnimation() method hasn't finished, so 2 startAnimation() method calls are running at the same time, but with different value of i, so the dialog shows in more than one place. To fix this, we need to end the previous startAnimation() method, before starting it again."
- video uses `on`, but Solution uses `click`
- spaces: `$("a").click(function(e){`
- `//on click "start over"`
- spaces: `startAnimation(1500,250);`
- in the video, this function doesn't take any arguments: `startAnimation(1500,250);`

//======================== HTML Data Attributes =========================//
- backticks (in this and other assignments)
- dots and parens in function names in prose
- comment spacing
- add info that data set with `attr` won't be reflected when retrieved with `data`
- keyword-spacing
----
-- " allows you to specify the attribute name and the value will be returned. "
- " With this method, you have to be very careful with how and when you use it, since it can be used for two different data sets. "
- "rather than jQuery, you can, however "
- "says it should "
- 'key/value '
- tense: " would be "
- clarify: "This differs from jQuery in that the newly added data attributes are stored internally rather than rewritten as HTML data attributes."
- `'Newman\'s Own';`
- "you'll most often see multi-word properties and variables either converted to camel case or what is called snake case. "
- is this really necessary at this point in the course?: "Camel case gets its name from generally having the uppercase letters that signify the start of each new word be taller than the other letters, or forming humps on a camel's back. Snake case gets its name mostly because it's a corresponding animal name that compliments camel case. Snake case uses underscores to separate words rather than uppercase letters."
- rewrite explanation or delete: "Snake case gets its name mostly because it's a corresponding animal name that compliments camel case. "

//======================== Project: Search Filtering, Part 1: Structure and Styles =========================//
- period after list items in prose
- the instructor in the video doesn't appear to know how to use a text editor (ex: he individually edits each game list item -- watching him do this is a waste of time)

//======================== Project: Search Filtering, Part 2: Interactivity =========================//
- same style issues as other assignments
- "move to"

//======================== Project: Dynamic Animations, Part 1: Structure and Styles =========================//
- period after list items in prose
- backticks
- same code style issues as other assignments (in video and example solution page)
- various issues with functionality of example solution
  - ex: shapes can start or end out of bounds of the canvas
-----
- - "Create new shape when form submitted. Its initial position is set to start x and y and CSS class is determined by shape type "
- "Clicking start will animate all shapes based on stored start and end positions -\n- Clicking stop will stop all current animations -\n- At any point, when you're stuck, you can check the"
- "In the form, the fields you'll need will be a choice between square, circle, and star shapes, starting x and y coordinates, and ending x and y coordinates. Your three shapes should be the same width and height, 30px by 30px. The square and circle elements can be made with CSS."

//======================== Project: Dynamic Animations, Part 2: Animations =========================//
- period after list items in prose
- backticks
- same code style issues as other assignments (in video and example solution page)
- example solution page doesn't have "duration" input
-----
- " capture the 5 inputs:"
- no https for "append method" link
- " into two parts for you to tackle one at a time."
- "For this step, write an event handler for the form submission. In the event handler, we want to capture the 5 inputs:"
- "Start the animation with the ***starting*** and ending points. "
- not necessary to quote "class" as a property name
- "you can add an extra field "duration" to the form when you create each shape, so that each shape can have a different animate duration."
- " pull out code from the event handler callback "
- "return to it and will make"
- "should focus on in order "
- "This will also make it easier to allow for code reuse."
- "If you are stuck, watch the rest of the solution video below."

//======================== Project: Array and Object Utility Library =========================//
- " the array prototype" (x2+...)
  - " methods on arrays"
  - " array methods."
- backticks (ex: $, true, false, last, 1, Array, undefined, Number, Boolean)
- same code style issues as previous assignments
- undeclared variable `u` (x2+...)
- inconsistent use of newlines in tests js file
- wrap IIFEs in parens (including invocation parens)
- why use IIFEs in some of the tests...? (ex: _.first)
- names of methods (in tests) should be changed so that it's evident whether the method is called directly on `_` (ex: `last`) or is called on the return value of the `_` function (ex: `range`, extend, etc...)
- logging the error in the `test` function would be helpful
- no comment titles for `is*` methods
- fix formatting and clarify descriptions (rephrase) of all list items of methods (ex: commas, periods, phrasing, etc...)
- colons after paragraphs above videos
- it seems really unnecessary to create certain functions, like `lastIndexOf` which has been in JS since ES5...
- it's not specified if the methods should all work with both arrays and objects (and other types...)
- "`element`" is a confusing variable name for the argument of `_`
- many of the method explanations could be improved and clarified, such as `sample` -- which doesn't even specify that the element(s) should be random, and `pluck` (see the `_`.js documentation for ideas)
- there's no link to the completed assignment
- fix 's's at the end of various things in lists like return vs returns and start vs ends (ex: " If two arguments are supplied, returns an array of values that start with the first argument and ends with the second value. ")
- not always an argument in `_(obj).method()` form: "return true if argument"
-----
- "you" and "we": "you have a central place to hold all of these useful methods, we also "
- "Not only do you have a central place to hold all of these useful methods, we also have the ability to transport them easily between projects. "
- "underscore character, or _."
- `range` tests ends *before* the second value: "and ends with the second value. "
- "`test("without retains the elements that aren't remove"`"
- tests and prose don't make it clear what the `sample` method is supposed to do
- " removed and the second "
- `pluck` tests could be combined, since they share the same two lines of code
  - some of the other tests also could be combined as well, such as `extend`
- `crazy_object` is accidentally a global variable because there's a semicolon in line above instead of a comma
  - `crazy_object` is not referenced in the first or second `extend` test
- rewrite `pick` tests (confusing as is...)
  - also, they don't test for if extra properties (that exist on the original object but aren't passed as an argument) are included in the returned object
  - "`test('has returns false when property does not exist',`" only tests for falsiness, not actual `false`
- "Check out this video [plural] for help with any of the object and collection methods."
- "non-omited properties"
- "The rest are covered in this video."
- "Utility methods."
- comma after ie and 'j' after `ob`: " (i.e. _.isElement(ob)"
- "isElement, return true" (x2+...)
- should only return true if a basic object (ie, not array or function): "`'isObject returns true if object or function, otherwise false`"
- the `isElement` test doesn't test for false positives from non-element nodes
- the `isObject` test should test for `null`
- test also checks for String objects: "isString, return true if argument is a string. "
- in video, he incorrectly says the `range` method goes up to 10, when it actually only goes up to 9

//======================== Project: Guess a Word, Part 1: Structure and Styles =========================//
- watching shane's videos is the most difficult part of the course to get through (even after successfully completing the entire assignment on my own)...
  - I don't feel like I can rely on anything that he says or does (to be a good way of doing anything)
  - I don't want to copy what he does because it might be the wrong way to do it (and sometimes I know it is)
  - it would be great if all the walkthrough videos were redone with a different instructor doing them. I really like all of Kevin, Chris, and Jim's videos -- they are very helpful, interesting, informative, and enjoyable to watch and I feel like I always learn a lot from them (which is the complete opposite of how I feel about Shane's videos)
-----
- same style issues as other assignments
-----
- capitalize "guess a word"...?
- "letters to the word"
- "the apples spritesheet that we will use to display the number of [incorrect] guesses left."
- " 6 apples shown and ending with one shown"
- " SVG (scalable vector graphics)"
- "SVGeneration - just "
- " the "exportable css" and"
-----
- he finally talks about the order of CSS properties after doing probably 30+ videos...

//======================== Project: Guess a Word, Part 2: Core Functions =========================//
- comment spacing
- capital letters and periods after list items in markdown
- backticks ("Game", "words array", etc)
- quote words (ex: banana) in comments
- Solutions 1 and 2 missing a semicolon
- same code style issues as previous assignments, such as:
  - double quoted strings
  - wrap IIFEs in parens
- code style of solution 3 and video is inconsistent with solutions 1 and 2

- "Game constructor "
- " has to be able to have access"
- rephrase: "Our function has to be able to have access to the words array defined outside of it, and with each call of the function, the function produces side effect to mutate the array to remove the element it used."
- remove semicolon from `randomWord` function declaration
- "array on the global namespace"
- " It would be better we can have words inside randomWord's function scope as private state so that"
- it says "Hint 2" but there is only one hint
- maybe rephrase: "We need to wrap the above code in an IIFE so the function scope protects private variables defined inside. To keep the private states around, we'll need to return a functon (or an object with methods in it) to create an closure."
- " an closure"
- rephrase: " You can read here and here to get a refresher on this topic."
- the first closure link has some bugs/errors (ex: the example with `makeHelpCallback` doesn't actually work because it doesn't run after DOMContentLoaded)
- the second closure link is broken
- " another alternative solution, used in the solution video:"
- solution 3 is unecessarily very confusing, indirect, and wasteful of resources (like the `without` function) and has poorly named variables (like `el` instead of `word`)
- "There're "
- "you could try to use both the pseudoclassical pattern or the OLOO pattern when it comes to the game object creation."


//================================================================================//
//==============================================================================//*/
/* eslint-enable */
