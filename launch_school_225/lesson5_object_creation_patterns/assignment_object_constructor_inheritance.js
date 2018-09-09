/*
IMPORTANT:
  - I'm submitting this as a bug because I think this assignment should be completely redone or removed from course ASAP because it only increases confusion and wastes time.
  - I wrote this pretty quickly, so let me know if you need any clarification on anything.
___
- This whole assignment is confusing and inconsistent/contradictory with a lot of the other assignments -- even the text and video contradict each other.
  - both the video and text were way more confusing than helpful -- they should be removed from the course
  - both use a lot of weird terms, or terms that have never been used before in the course, for example:
     - "child prototypes" (text)
     - "singleton" for object literal
  - the video and text instructions are inconsistent with each other too, for example:
     - like defining properties on `Vehicle.prototype`
     - 2 coupes in text, 1 in video
     - changing coupe doors to 2 after creating Coupe constructor
     - setting the constructors for Motorcycle and Coupe prototypes back to the originals
     - Motorcycle inheriting from Vehicle
     - `prototype_car` in video, not text
  - not a very interesting or educational assignment either
  - better to remove video and redo whole assignment, or delete it, or make a new one that's different
- other video problems:
   - horrible explanations and way more confusing than helpful (text not so good either)
   - deleted `constructor` property from `Vehicle.prototype` by reassigning the prototype to a new object
   - why did he need to create an `o` variable in `Motorcycle`...? -- seems unnecessary
      - done in a totally different way in previous exercise (to call without `new` keyword)
   - not capitalizng `prototype_car`
   - style issues, such as:
       - no newline after `if` block
       - using snake case instead of camel case
- other text problems:
  - wrap numbers in backticks
  - all of the instructions really confusing/unclear about what is expected
    - should be 'constructor function'...?: "Define the Vehicle prototype "
       - or else this should be 'prototype'...?: "Note that once you change the object's property, it is no longer the property that came from the constructor."
  - backticks: " instanceof "
*/
//============================================================================//


const Vehicle = function () {
  // this.doors  = 4;
  // this.wheels = 4;
};

Vehicle.prototype.doors  = 4;
Vehicle.prototype.wheels = 4;

let sedan = new Vehicle;
let coupe = new Vehicle;
coupe.doors = 2;

p(sedan.hasOwnProperty('doors'));
p(coupe.hasOwnProperty('doors'));
p();



const Coupe      = function () {};
const Motorcycle = function () {};

Coupe.prototype      = Object.create(new Vehicle);
Motorcycle.prototype = Object.create(new Vehicle);

Coupe.prototype.constructor      = Coupe;
Motorcycle.prototype.constructor = Motorcycle;

Coupe.prototype.doors       = 2;
Motorcycle.prototype.doors  = 0;
Motorcycle.prototype.wheels = 0;

let coupe2 = new Coupe;
let moto   = new Motorcycle;

p(coupe2 instanceof Coupe);
p(coupe2 instanceof Vehicle);
p(coupe2 instanceof Motorcycle);
p(moto   instanceof Motorcycle);
p();


const Sedan = function () {};
Sedan.prototype = Object.create(Vehicle.prototype);

let sedan = new Sedan;
p(sedan instanceof Sedan);
p(sedan instanceof Vehicle);
p(sedan instanceof Motorcycle);
