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

//================================================================================//
//==============================================================================//*/
/* eslint-enable */
