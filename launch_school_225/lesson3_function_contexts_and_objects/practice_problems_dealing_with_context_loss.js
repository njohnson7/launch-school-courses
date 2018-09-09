/*
- function keyword spacing
- trailing commas
- double quoted strings
- comment spacing

___

- #3, #6: code snippet should be in JS style
- #4, #5, #6, #7, #8, #9 (x2): semicolon after obj literal
- #5, #6, #9: highlight changed lines in solution
- #6: " sets that argument as [the...?] execution context"
- #7:
  - button should say "Solution" not "Submit"
  - code snippet needs line numbers, since Solution references "line 5"
- #8: button should say "Solution" not "Show"
- #9:
  - rephrase: "By changing the syntax according to which we create the variable increment and assign our function to it from function declaration to function expression, we gain the ability to bind the resultant function to an execution context. "
  - remove word...?: " this points ~~back~~ to "
*/
//======================== 1 =========================//

// let turk = {
//   firstName:  'Christopher',
//   lastName:   'Turk',
//   occupation: 'Surgeon',
//   getDescription() {
//     return `${this.firstName} ${this.lastName} is a ${this.occupation}.`;
//   },
// };

// function logReturnVal(func) {
//   let returnVal = func();
//   p(returnVal);

//   p(func.call(turk));
//   p(func.apply(turk));

//   let boundFunc = func.bind(turk);
//   p(boundFunc());
// }

// logReturnVal(turk.getDescription);

// logReturnVal(turk.getDescription.bind(turk));


//======================== 2 =========================//

// let turk = {
//   firstName:  'Christopher',
//   lastName:   'Turk',
//   occupation: 'Surgeon',
//   getDescription() {
//     return `${this.firstName} ${this.lastName} is a ${this.occupation}.`;
//   },
// };

// function logReturnVal(func, context) {
//   let returnVal = func.call(context);
//   p(returnVal);
// }

// logReturnVal(turk.getDescription, turk);



//======================== 3 =========================//

// let turk = {
//   firstName:  'Christopher',
//   lastName:   'Turk',
//   occupation: 'Surgeon',
//   getDescription() {
//     return `${this.firstName} ${this.lastName} is a ${this.occupation}.`;
//   },
// };

// function logReturnVal(func) {
//   let returnVal = func();
//   p(returnVal);
// }

// let getTurkDescription = turk.getDescription.bind(turk);
// logReturnVal(getTurkDescription);


//======================== 4, 5, 6 =========================//

// let TESgames = {
//   titles:      ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   listGames() {
//     this.titles.forEach(function (title) {
//       p(`${this.seriesTitle} ${title}`);
//     });
//   },
//   listGames() {
//     let self = this;
//     this.titles.forEach(function (title) {
//       p(`${self.seriesTitle} ${title}`);
//     });
//   },
//   listGames() {
//     this.titles.forEach(function (title) {
//       p(`${this.seriesTitle} ${title}`);
//     }, this);
//   },
//   listGames() {
//     this.titles.forEach(function (title) {
//       p(`${this.seriesTitle} ${title}`);
//     }.bind(this));
//   },
//   listGames() {
//     this.titles.forEach(title => p(`${this.seriesTitle} ${title}`));
//   },
// };

// TESgames.listGames();


//======================== 7, 8 =========================//

// let foo = {
//   a: 0,
//   incrementA() {
//     function increment() {
//       this.a += 1;
//     }

//     let inc2 = function () {
//       this.a += 1;
//     }.bind(this);

//     let self = this;
//     function inc3() {
//       self.a += 1;
//     }

//     const inc4 = _ => this.a++;

//     function inc5(context) {
//       context.a += 1;
//     }

//     increment();

//     increment.call(this);
//     increment.apply(this);
//     increment.bind(this)();
//     inc2();
//     inc3();
//     inc4();
//     inc5(this);
//   }
// }

// foo.incrementA();
// foo.incrementA();
// foo.incrementA();

// p(foo.a);
// p(a);


//======================== 9 =========================//

let foo = {
  a: 0,
  incrementA() {
    const increment = function () {
      this.a += 1;
    }.bind(this);

    [...Array(3)].forEach(increment);
  }
}

foo.incrementA();
foo.incrementA();
foo.incrementA();

p(foo.a);
