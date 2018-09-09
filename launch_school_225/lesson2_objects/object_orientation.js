/*
- General:
  - trailing commas
  - comment spacing
  - `=>` is used here to indicate a return value, but on the "How We Display Code" page it's used to indicate a console log. It's not really used much anywhere else (at least in 210 and up to this point in 225). Maybe there should be a guideline for consistent usage, or it should never be used.
  - function keyword spacing
- "At its core, object-oriented programming is a pattern that uses objects as the basic building blocks of a program instead of local variables and functions."
  - sounds incorrect because aren't objects generally assigned to local variables, and created using functions and have methods...?
- remove comma:
  - "track more than one vehicle ~~,~~ [maybe...?] though, perhaps a car and a truck"
  - "This code is straightforward, but ~~,~~ as the number of vehicles "
- "What happens when we [have] 100 [a hundred] vehicles? 1000 [a thousand]?"
- fix commas: "Suppose we also need to calculate how far each vehicle can travel by multiplying its fuel economy, miles per gallon (mpg), by its fuel capacity, in gallons:"
- "This approach is even better for large projects that contain data for hundreds [emdash] or even thousands [emdash] of vehicles."
- maybe emdash for clarification...?: "The object-oriented approach to programming puts data and procedures that manipulate that data into containers or objects."
- "We no longer deal solely with primitives ~~,~~ or composites of primitives, but "smart" objects that can perform actions on the data they own."
- rephrase...?: "When we must make changes, we can restrict those changes to those objects ~~;~~ [emdash] they don't ripple throughout the entire project. "
- needs newline between end of object literal and `smallCar.range();   // => 288.6`
- maybe...?: "Refactoring can reduce duplication in a project's code, ~~including this simple project.~~ [even with a simple project like this]"
- " It's important to understand ~~,~~ [maybe...?] though, that ~~duplication reduction~~ [reducing duplication] is not the goal ~~:~~ [emdash] it's a side-effect."
- "Compare the object-oriented code to the code ~~with which we began~~ [we started out with]."
- maybe change to active voice...?: "Here are some questions that are easier to answer with the object-oriented code:"
  - "The object oriented code makes these [or 'the following'] questions easier to answer:"
- fix (remove...?) newline spacing in "Objects:" info box
*/

var smallCarFuel = 7.8;
var smallCarMpg = 37;

var largeCarFuel = 9.4;
var largeCarMpg = 29;

var truckFuel = 14.3;
var truckMpg = 23;

function vehicleRange(fuel, mpg) {
  return fuel * mpg;
}

p(vehicleRange(smallCarFuel, smallCarMpg)); // => 288.6
p(vehicleRange(largeCarFuel, largeCarMpg)); // => 272.6
p(vehicleRange(truckFuel, truckMpg));       // => 328.9
