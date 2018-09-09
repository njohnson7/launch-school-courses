/*

- trailing commas
- function keyword spacing
___

- rephrase: "If the new price isn't non-negative"
- add emdash: "We want our code to take an object-oriented approach to keeping track of the products, and although the functions we just wrote work fine, since they are manipulating data in the objects, we should place them in the objects themselves. "
- #4, #5, #6: `newPrice > 0` should be `>=` (4 occurrences)
- #5, #6:
  - change comma after `setPrice` to a semicolon
  - add newline after `setPrice`
  - add semicolon after `describe`
  - maybe change function so that it just returns an object literal, instead of assignment of each property


*/



const makeItem = (name, stock, price) => ({
  name,
  stock,
  price,
  setPrice(price) {
    price < 0 ? p('Invalid price.') : this.price = price;
  },
  describe() {
    p(`Name: ${this.name}`);
    p(`ID: ${this.id}`);
    p(`Price: $${this.price}`);
    p(`Stock: ${this.stock}`);
  },
});

let inventory = {
  items: [],
  getNextId() {
    let ids = this.items.map(item => item.id).sort();
    for (let i = 0; i <= ids.length; i++) {
      if (ids[i] !== i) return i;
    }
  },
  add(item) {
    item.id = this.getNextId();
    this.items.push(item);
  },
  displayItems() {
    this.items.forEach(console.log);
  },
  setPrice(name, price) {
    let item = this.getItem(name);
    item ? item.setPrice(price) : p('Item not found.');
  },
  getItem(name) {
    return this.items.find(item => item.name === name);
  },
  describeItem(name) {
    let item = this.getItem(name);
    if (!item) p('Item not found.');
    item.describe();
  },
};

let scissors = makeItem('Scissors', 8, 10);
let drill    = makeItem('Cordless Drill', 15, 45);
let hat      = makeItem('Hat', 20, 50);

inventory.add(scissors);
inventory.add(drill);
inventory.add(hat);

inventory.setPrice('Hat', 242);

inventory.displayItems();
p(inventory);
p();


// inventory.displayItems();
inventory.setPrice('Hat', 100);
inventory.displayItems();
p();

inventory.setPrice('Fish', 200);
inventory.setPrice('Hat', -1);
inventory.displayItems();
p();

p(Object.entries(hat));

inventory.describeItem('Scissors');
p();
