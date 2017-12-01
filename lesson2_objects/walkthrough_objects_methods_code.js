










// var greeter = {
//   morning: function () {
//     p('morning!');
//   },
// };

// function evening() {
//   p('evening!');
// }


// greeter.morning();


// evening();

// foo = greeter.morning;
// foo();


// let counter = {
//   count: 0,
//   advance() {
//     this.count++;
//   },
//   bob: this.count,
// };

// p(counter);
// p(counter.advance());
// p(counter.advance());
// p(counter);
// p(counter.advance());
// p(counter.advance());
// p(counter);


// let car = {
//   fuel: 7.8,
//   running: false,
//   start() {
//     this.running = true;
//   },
// };

// p(car);
// p(car.start());
// p(car);

// car.stop = function () {
//   this.running = false;
// };

// p(car);
// p(car.stop());
// p(car);

// car.drive = function (distance) {
//   this.fuel -= distance / 52;
// };

// // car.drive = distance => this.fuel -= distance / 52;

// car.drive(5);
// p(car)
// car.drive(50);
// p(car)




let bob = { first: 'Bob', last: 'Loblaw' };
// p(bob);

let fred = {};
fred.first = 'Fred';
fred.last = 'Smith';
// p(fred);

// const fullName = ({ first, last }) => p(`${first} ${last}`);

// // fullName(bob);
// // fullName(fred);

// let people = [];

// people.push(bob, fred);

// people.forEach(fullName);


let people = {
  collection: [bob, fred],
  lastIdx: 0,
  fullName({ first, last }) {
    p(`${first} ${last}`);
  },

  rollCall() {
    this.collection.forEach(this.fullName);
  },

  isValidPerson(person) {
    return typeof person.first === 'string' && typeof person.last === 'string';
  },

  add(person) {
    if (this.isValidPerson(person)) {
      person.idx = this.lastIdx;
      this.collection.push(person);
      this.lastIdx++;
    }
  },

  getIdx({ first, last }) {
    return this.collection.findIndex(({ first: f, last: l }) => first + last === f + l);
  },

  remove(person) {
    if (!this.isValidPerson(person)) return;
    let idx = this.getIdx(person);
    if (~idx) this.collection.splice(idx, 1);
  },

  get(person) {
    if (!this.isValidPerson(person)) return;
    let idx = this.getIdx(person);
    if (~idx) return this.collection[idx];
  },

  update(person, first = person.first || '', last = person.last || '') {
    if (!this.isValidPerson(person)) return;
    let idx = this.getIdx(person);
    if (~idx) {
      this.collection[idx].first = first;
      this.collection[idx].last = last;
    }
  },
};

people.rollCall();
p();

let larry = { first: 'Larry', last: 'David' };
people.add(larry);
people.rollCall();
p();

people.rollCall();
p(people.getIdx(larry));
people.remove(larry);
people.remove({});
p(people.getIdx(larry));
people.rollCall();
p();

p(people.get(bob));
p(people.get(larry));
p(people.update(bob, 'Robert'));
people.rollCall();
p(people.update({}, 'fred', 'jones'))
p(people)
p(people.add(larry))
p(people)

p();
p();
p();
p();
