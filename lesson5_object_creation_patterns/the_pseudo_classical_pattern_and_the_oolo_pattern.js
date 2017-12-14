/*
- function keyword spacing
- trailing commas
- comment spacing
- semicolons after function expressions ending brace

___

- fix: "The OLOO stands for "Object Linking to Other Objects", is first popularized by Kyle Simpson. "
- fix: "Here JavaScript sheds its pretense to be a "class oriented" language, where it uses constructor functions as fake classes."
- fix: " on an prototype "
- fix: "then use Object.create()"
- fix: "without going through the roundabout way that involves "constructors and their prototype properties" at all."
*/
//============================================================================//

// let pointA = {
//   x: 30,
//   y: 40,

//   onXAxis() {
//     return this.y === 0;
//   },

//   onYAxis() {
//     return this.x === 0;
//   },

//   distanceToOrigin() {
//     return Math.hypot(this.x, this.y);
//   },
// };

// p(pointA.distanceToOrigin());    // 50
// p(pointA.onXAxis());             // false
// p(pointA.onYAxis());             // false
// p();



//============================================================================//


// const Point = function (x = 0, y = 0) {
//   this.x = x;
//   this.y = y;
// };

// Point.prototype.onXAxis = function () {
//   return this.y === 0;
// };

// Point.prototype.onYAxis = function () {
//   return this.x === 0;
// };

// Point.prototype.distanceToOrigin = function () {
//   return Math.hypot(this.x, this.y);
// };

// let pointA = new Point(30, 40);        // use new to create objects
// let pointB = new Point(20);

// p(pointA instanceof Point);            // use `instanceof` to check type
// p(pointB instanceof Point);

// p(pointA.distanceToOrigin() === 50);   // true
// p(pointB.distanceToOrigin() === 20);   // true
// p(pointB.onXAxis());                   // true
// p();



//============================================================================//


// const makePoint = (x = 0, y = 0) => ({
//   x,
//   y,

//   onXAxis() {
//     return y === 0;
//   },

//   onYAxis() {
//     return x === 0;
//   },

//   distanceToOrigin() {
//     return Math.hypot(x, y);
//   },
// });

// let pointC = makePoint(30, 40);
// p(pointC.distanceToOrigin());    // 50
// p(pointC.onXAxis());             // false
// p(pointC.onYAxis());             // false
// p();



//============================================================================//


const Point = {
  x: 0,
  y: 0,

  onXAxis() {
    return this.y === 0;
  },

  onYAxis() {
    return this.x === 0;
  },

  distanceToOrigin() {
    return Math.hypot(this.x, this.y);
  },

  init(x, y) {
    this.x = x;
    this.y = y;
    return this;
  },
};

let pointA = Object.create(Point).init(30, 40);
let pointB = Object.create(Point);

p(Point.isPrototypeOf(pointA));        // use `isPrototypeOf` to check type
p(Point.isPrototypeOf(pointB));

p(pointA.distanceToOrigin());          // 50
p(pointB.onXAxis());                   // true
p();


let pointD = Object.create(Point);
pointD.x = 42;
pointD.y = 0;

p(pointD.distanceToOrigin());    // 42
p(pointD.onXAxis());             // true
p(pointD.onYAxis());             // false
p();
