/*
- trailing commas
- function keyword spacing
- double quoted strings

___

- #1: "what does ~~it~~ [the method] return"
- #3: rephrase Solution to clarify that `bind` creates a new function, not mutates
- #5:
  - wrap "0" in backticks
  - "Recall that ~~a~~ nested functions lose the outer method's context."
  - add note about removing `this` keyword from `tax`
  - last example with `call` should probably have `specialDiscount` as a function declaration instead of expression

*/
//======================== 2 =========================//


// var myObject = {
//   count: 1,
//   myChildObject: {
//     myMethod: function() {
//       p(myObject.count);
//       p(this.count);
//     },
//   },
// };

// myObject.myChildObject.myMethod.call(myObject);


//======================== 5 =========================//

// var computer = {
//   price: 30000,
//   shipping: 2000,
//   total: function() {
//     var tax = 3000;

//     function specialDiscount() {
//       if (this.price > 20000) {
//         return 1000;
//       } else {
//         return 0;
//       }
//     }

//     return this.price + this.shipping + tax - specialDiscount.call(this);
//   },
// };

// console.log(computer.total());


let computer = {
  price:    30000,
  shipping: 2000,
  total() {
    const TAX = 3000;
    const specialDiscount = _ => this.price > 20000 ? 1000 : 0;
    return this.price + this.shipping + TAX - specialDiscount();
  },
};

p(computer.total());