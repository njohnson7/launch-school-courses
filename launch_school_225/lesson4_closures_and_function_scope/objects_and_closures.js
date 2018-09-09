/*
- function keyword spacing
- double quoted strings
- trailing commas

___

- #1: "Reimplement makeList ~~,~~ so [that] it returns "
- #2:
  - `// since ~~they are~~ [it is] an object property`
  - `// items not accessible from outside ~~object~~ [function]`
  - `// since ~~they are~~ [it is] within ~~an~~ [a] closure`
- should have a `=` before `[]`: `> list.items; ... []`
- "With the solution from problem 2, though, we can't readily add a method:":
  - plural --> singular: `  // there is no way to access the items from within this method  // because the closure that contains them is inaccessible`
  - missing semicolons in code snippet on two lines
  - should be ReferenceError: `// => throws Reference error!`
*/
//============================================================================//

//======================== 1 =========================//

// const makeList = _ => ({
//   items: [],
//   list() {
//     this.items.length ? this.items.forEach(item => p(item)) : p('The list is empty.');
//   },
//   add(item) {
//     if (!this.items.includes(item)) {
//       this.items.push(item);
//       p(`${item} added!`);
//     }
//   },
//   remove(item) {
//     let idx = this.items.indexOf(item);
//     if (~idx) {
//       this.items.splice(idx, 1);
//       p(`${item} removed!`);
//     } else {
//       p(`${item} not found.`);
//     }
//   },
// });

// let list = makeList();
// list.add('peas');       // peas added!
// list.list();            // peas
// list.add('corn');       // corn added!
// list.list();            // peas // corn
// list.remove('peas');    // peas removed!
// list.list();            // corn

// list.remove('pasta');

// p(list.items);



//======================== 2 =========================//

const makeList = _ => {
  let items = [];
  return {
    list() {
      items.length ? items.forEach(item => p(item)) : p('The list is empty.');
    },
    add(item) {
      if (!items.includes(item)) {
        items.push(item);
        p(`${item} added!`);
      }
    },
    remove(item) {
      let idx = items.indexOf(item);
      if (~idx) {
        items.splice(idx, 1);
        p(`${item} removed!`);
      } else {
        p(`${item} not found.`);
      }
    },
  };
};

let list = makeList();
list.add('peas');       // peas added!
list.list();            // peas
list.add('corn');       // corn added!
list.list();            // peas // corn
list.remove('peas');    // peas removed!
list.list();            // corn

list.remove('pasta');

p(list.items);

let list2 = makeList();
list2.add('dog');
list2.list();
list.list();


// let list = makeList();
// list.clear = function () {
//   this.items = [];
//   p('all items deleted!');
// };


// let list = makeList();
list.clear = function () {
  // there's no way to access `items`
  //  from within this method because the
  //  closure that contains it is inaccessible.
  p(items);         // ReferenceError
  p(this.items);    // undefined
};

list.clear();
