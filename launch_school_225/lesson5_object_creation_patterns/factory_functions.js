/*
- function keyword spacing
- single quoted comments
- trailing commas

___

- change to double quotes: " (also called the 'Factory Object Creation Pattern') "
- " provide[s] us a way "
- semicolon after `person.fullName` assignment
*/
//============================================================================//


// function createPerson(firstName, lastName = '') {
//   let person = {};
//   person.firstName = firstName;
//   person.lastName  = lastName;
//   person.fullName  = function () {
//     return `${this.firstName} ${this.lastName}`.trim();
//   };

//   return person;
// }



const createPerson = (firstName, lastName = '') => ({
  firstName,
  lastName,
  fullName() {
    return `${this.firstName} ${this.lastName}`.trim();
  },
});

let john = createPerson('John', 'Doe');
let jane = createPerson('Jane');

p(john.fullName());
p(jane.fullName());
