/*

- double quoted strings (except for `"haven't"`)
- trailing commas
- function keyword spacing
- missing semicolons after return statements of `makeCountry`
- comment spacing
- highlight changed lines of code in solutions...?
- #1: missing semicolons after var declarations
- #3, 4: "such that" --> "so that"
- #4:
  - change "--" to emdash
  - "ES2015" --> add "(ES6)"
     - spacing in `visited=false`
     - maybe good place to mention other ES6 features, like object method shorthand, property value shorthand, template literal, and arrow function -- including an example

*/



const makeCountry = (name, continent, visited = false) => ({
  name,
  continent,
  visited,
  getDescription() {
    return `${this.name} is located in ${this.continent}. I have${this.visited && "n't"} visted ${this.name}.`;
  },
  visitCountry() {
    this.visited = true;
  },
});

let chile       = makeCountry('The Republic of Chile',        'South America');
let canada      = makeCountry('Canada',                       'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

p(chile.getDescription());        // "The Republic of Chile is located in South America."
p(canada.getDescription());       // "Canada is located in North America."
p(southAfrica.getDescription());  // "The Republic of South Africa is located in Africa."

p(chile);
let japan = makeCountry('Japan', 'Asia', true);
p(japan);

chile.visitCountry();
p(chile);

p(canada.getDescription());  // "Canada is located in North America. I haven't visited Canada."
canada.visitCountry();
p(canada.getDescription());  // "Canada is located in North America. I have visited Canada."
