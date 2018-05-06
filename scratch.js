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

text-field
 red colored
the field. e.g "Password
a required field".
 are corrected"
 built in
`$('form')[0]`
Please Enter


//======================== 2 - Form Validation, Part 2: Character Blocking Input =========================//
- the patterns for first name and last name are different from each other
- the patterns in the solution don't match the requirements
- how can first or last name be invalid when invalid characters are blocked?
- solution: code style / refactor

the pattern a-zA-Z\s'
for First Name and last name.
Please Enter

//======================== 3 - Automatic Tab Forwarding =========================//
- solution: code style / refactor
- no Discussion

//======================== 4 - Serializing Forms =========================//
- solution: code style / refactor

 e.g.

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

 correct, wrong or
the universe and everything?
You didn not

//================================================================================//
//==============================================================================//*/


const QUESTIONS = [{
  id:          1,
  description: "Who is the author of <cite>The Hitchhiker's Guide to the Galaxy</cite>?",
  options:     ['Dan Simmons', 'Douglas Adams', 'Stephen Fry', 'Robert A. Heinlein'],
}, {
  id:          2,
  description: 'Which of the following numbers is the answer to Life, the universe, and everything?',
  options:     ['66', '13', '111', '42'],
}, {
  id:          3,
  description: 'What is Pan Galactic Gargle Blaster?',
  options:     ['A drink', 'A machine', 'A creature', 'None of the above'],
}, {
  id:          4,
  description: 'Which star system does Ford Prefect belong to?',
  options:     ['Aldebaran', 'Algol', 'Betelgeuse', 'Alpha Centauri'],
}];
const ANSWER_KEY = { 1: 'Douglas Adams', 2: '42', 3: 'A drink', 4: 'Betelgeuse' };

const qs  = document.querySelector.bind(document);
const qsa = selector => [...document.querySelectorAll(selector)];

const QUESTION_TEMPLATE = qs('#questionTemplate').innerHTML.trim();
const TOKEN             = /#\{(.+?)\}/g;
const TOKEN_EACH        = /#\{each_S (.+?)\}([\s\S]+?)#\{each_E\}/;

const simpleSub = (template, obj, parentObj) => (
  template.replace(TOKEN, (_, prop) => (
    prop == '.' ? obj : prop.startsWith('../') ? parentObj[prop.slice(3)] : obj[prop]
  ))
);

const nestedSub = (template, obj) => (
  template.replace(TOKEN_EACH, (_, prop, nestedTemp) => (
    obj[prop].map(item => simpleSub(nestedTemp, item, obj)).join('')
  ))
);

const buildHtml = (template, obj) => (
  template.includes('#{each_S') ? buildHtml(nestedSub(template, obj), obj) : simpleSub(template, obj)
);

const buildQuestion   = question => buildHtml(QUESTION_TEMPLATE, question);
const renderQuestions = _ => (questionsList.innerHTML = QUESTIONS.map(buildQuestion).join(''));

const markCorrect = result => {
  result.innerText = 'Correct Answer';
  result.classList.add('correct');
};

const markIncorrect = (result, userAnswer, answer) => {
  let explanation = userAnswer ? 'Wrong Answer' : 'You did not answer this question';
  result.innerText = `${explanation}. The correct answer is: "${answer}".`;
  result.classList.add('incorrect');
};

const getUserAnswer = id => form[`q${id}`].value;
const getResult     = id => results.find(result => result.parentElement.id == `q${id}`);

const showResult = ({ id }) => {
  let userAnswer = getUserAnswer(id);
  let result     = getResult(id);
  let answer     = ANSWER_KEY[id];
  userAnswer == answer ? markCorrect(result) : markIncorrect(result, userAnswer, answer);
};

const handleSubmit = e => {
  e.preventDefault();
  toggleDisabled();
  QUESTIONS.forEach(showResult);
};

const toggleDisabled = _ => {
  form.submit.disabled = !form.submit.disabled;
  form.reset.disabled  = !form.reset.disabled;
};

const resetResult = result => ([result.className, result.innerText] = ['result', '']);

const resetForm = _ => {
  toggleDisabled();
  results.forEach(resetResult);
};

let form          = qs('form');
let questionsList = qs('#questionsList');
renderQuestions();
let results       = qsa('.result');

form.onsubmit = handleSubmit;
form.onreset  = resetForm;