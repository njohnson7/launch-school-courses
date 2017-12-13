/*
- function keyword spacing
- comment spacing
- inconsistent use of function expressions vs declarations for constructor functions in this assignment and the previous one
- missing semicolons after many of the method definitions
- fix: `// values for this are land, air, water` (x3 or 4)
- for all the `logs` comments, the format, `// logs "Foo says Woof!"`, is inconsistent with the previous assignments

___

- fix: " having it's prototype"
- add "the": " that Animal constructor "
- add "the": "of type property "
- rephrase: "This approach uses the object that Animal constructor returns as the value assigned to Dog.prototype. "
- fix: " define it.."
- fix: "It leverages the fact that objects that it creates has its __proto__ property set to the object that was passed in; in this case Animal.prototype."
- fix: `// continued from any of the method's code snippet (method1 or method2)`
- fix: `// continued from any of the three methods code snippet (method1 or method2)`
- fix: "Assigning Animal.prototype to Dog.prototype does lead to behavior to be shared with objects created from the Dog constructor. However, what isn't apparent is that additional behavior added to Dog.prototype also becomes available to objects created from the Animal constructor; which is often not what is expected and intended."
*/
//============================================================================//


// const Animal = function (type) {
//   this.type = type;
// };

// Animal.prototype.move = function () {
//   p('Animal is moving.');
// };

// const Dog = function () {};
// Dog.prototype = new Animal('land');

// Dog.prototype.say = function () {
//   p(`${this.name} says Woof!`);
// };

// Dog.prototype.run = function () {
//   p(`${this.name} runs away.`);
// };

// // Dog.prototype.__proto__ = Animal.prototype;
// // Dog.prototype.__proto__ = new Animal;

// let fido = new Dog;
// fido.move();
// fido.run();
// p(fido.type);



// // p(Dog.prototype)
// // Dog.prototype = new Animal();
// // p(Dog.prototype)
// // p(Dog.constructor = Dog);

// // let dog = new Dog;
// // p(dog.__proto__)
// // Object.setPrototypeOf(Dog, Animal.prototype);

// // Animal.prototype.run = function () { p('running') };
// // Dog.prototype.say    = function () { p('woof!') };

// // let animal = new Animal;
// // let dog    = new Dog;

// // p(animal);
// // p(dog);

// // animal.run();
// // dog.say();

// // dog.run();
// // dog.say();

// // p(dog.__proto__)
// // p(dog.__proto__.__proto__)
// // p(dog.__proto__.__proto__.__proto__)
// // p(dog.__proto__.__proto__.__proto__.__proto__)






//============================================================================//


// const Animal = function (type) {
//   this.type = type;
// };

// Animal.prototype.move = function () {
//   p('Animal is moving.');
// };

// const Dog = function () {
//   // Animal.call(this);
//   // this.name = 'dog';
// };

// Dog.prototype = Object.create(Animal.prototype);
// // Dog.prototype.constructor = Dog;
// p(Dog.prototype);

// const Dog2 = function () {};
// Dog2.prototype = new Animal('land');
// p(Dog2.prototype);

// const Dog3 = function () {};
// Dog3.prototype = new Animal('water');
// Dog3.prototype.swim = function () {
//   p('swim');
// };
// p(Dog3.prototype)

// let dog  = new Dog;
// let dog2 = new Dog2;
// let dog3 = new Dog3;
// p(dog)
// p(dog2)
// p(dog3)



// const Cat = function () {
//   this.species = 'Cat';
// }
// p(Cat);
// p(Cat.prototype);

// let cat = new Cat;
// p(cat);

// // p(dog instanceof Dog)
// // p(dog instanceof Animal)
// // p(dog2 instanceof Dog2)
// // p(dog2 instanceof Animal)

// Dog.prototype.say = function () {
//   p(`${this.name} says Woof!`);
// };

// Dog.prototype.run = function () {
//   p(`${this.name} runs away.`);
// };


// let fido = new Dog;
// fido.move();
// fido.run();
// p(fido);
// p(fido.__proto__);

// p(Dog.prototype === dog.__proto__)


//============================================================================//


// const Animal = function () {
//   this.foo = 42;
// };

// Animal.prototype.run = function () {
//   p('running');
// };

// Animal.prototype.cool = 'cool';

// const Dog  = function () {
//   this.dogMethod1 = _ => p('Dog')
// };
// const Dog2 = function () {
//   this.dogMethod2 = _ => p('Dog2')
// };
// const Dog3 = function () {
//   this.dogMethod3 = _ => p('Dog3')
// };

// Dog.prototype  = new Animal;
// Dog2.prototype = Object.create(Animal.prototype);

// Dog.prototype.constructor = Dog;
// // Dog2.prototype.constructor = Dog2;


// let dog  = new Dog;
// let dog2 = new Dog2;
// let dog3 = new Dog3;

// p(dog);
// p(dog2);
// p(dog3);
// p(dog.constructor);
// p(dog2.constructor);
// p(dog3.constructor);

//========================  =========================//


const Animal = function () {};

const Dog = function () {};
Dog.prototype = Animal.prototype;

Dog.prototype.say = function () {
  p('woof!');
};

let animal = new Animal;
animal.say();    // woof!


