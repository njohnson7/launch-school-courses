/*
- trailing commas
- double quoted strings
- `function` keyword spacing
- spacing after braces in object output/returns

___

- #1: "The return value of func, which is assigned [to] context, "
- #3: fix commas in discussion
- #4:
  - newline after `c` declaration
  - incomplete sentence: "In both cases a simple reference to b."
- #7:
  - missing semicolon after `fruitsObj`
  - `var` declaration not at top of scope
*/


//======================== 6 =========================//



let foo = { a: 1, b: 2 };
let bar = {
  a: 'abc',
  b: 'def',
  add() {
    return this.a + this.b;
  },
};

p(bar.add.call(foo));
p();


//======================== 7 =========================//

let fruitsObj = {
  list:  ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};

function outputList() {
  let args = [].slice.call(arguments);
  p(`${this.title}:`);
  args.forEach(elem => p(elem));
}

outputList.apply(fruitsObj, fruitsObj.list);
outputList.call(fruitsObj, ...fruitsObj.list);