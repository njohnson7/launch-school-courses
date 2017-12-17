/*
- function keyword spacing
- trailing commas

___

- #1: change to clearer word: "What are the two ~~principal~~ disadvantages of working with factory functions?"
- #3:
  - newlines after object literals...? (x2) (LOOKUP in style guide) (#5 has this -- inconsistent)
  - capitalize sentences in list and add periods
  - wrap numbers in backticks (x2)
  - move `var` to top (also #4, #5 (x4))
  - `i++` (also #4, #5 (x4))
  - add a space for indentation to 2nd and 3rd `invoices.push`
  - change to `this`: `return invoice.phone + invoice.internet;` (or maybe it's intentionally like this...?)
- #4:
  - spaces separating object literal braces (x4)
  - rephrase: "The function can take an object argument in one of the 3 forms:"
  - consistent usage of commas after "such as,"
  - capitals/periods in list
  - should be two lines: `phone: 1000, internet: 4500`
  - change to `this`: `return payment.amount || (payment.phone + payment.internet);` (or maybe it's intentionally like this...?)
  - "Or ~~to~~ [we can] return the object directly:"
- #5:
  - semicolon: `invoice.addPayment(payment1)`
  - comment spacing
  - space after `for`: "for(var i = 0; i < payments.length; i++) {" (x4)
  - change `invoice` to `this` in methods (or maybe it's intentionally like this...?)
  - variable shadowing: `paymentTotal` (x2)
*/
//============================================================================//


//======================== 2 =========================//

// function makeObj() {
//   var obj = {};
//   obj.propA = 10;
//   obj.probB = 20;
//   return obj;
// }


// const makeObj = _ => ({
//   propA: 10,
//   probB: 20,
// });

// p(makeObj().propA);
// p();



//======================== 3 =========================//

// let invoice = {
//   phone: 3000,
//   internet: 6500
// };
// let payment = {
//   phone: 1300,
//   internet: 5500
// };
// let invoiceTotal = invoice.phone + invoice.internet;
// let paymentTotal = payment.phone + payment.internet;
// let remainingDue = invoiceTotal - paymentTotal;

// p(paymentTotal);         // 6800
// p(remainingDue);         // 2700
// p();


//========================//


// const createInvoice = (services = {}) => ({
//   phone:    services.phone    || 3000,
//   internet: services.internet || 5500,
//   total() {
//     return this.phone + this.internet;
//   },
// });


// const createInvoice = ({ phone = 3000, internet = 5500 } = {}) => ({
//   phone,
//   internet,
//   total() {
//     return this.phone + this.internet;
//   },
// });

// const invoiceTotal = invoices => invoices.reduce((sum, invoice) => sum + invoice.total(), 0);

// let invoices = [];
// invoices.push(createInvoice());
// invoices.push(createInvoice({
//   internet: 6500,
// }));

// invoices.push(createInvoice({
//   phone:    2000,
// }));

// invoices.push(createInvoice({
//   phone:    1000,
//   internet: 4500,
// }));

// p(invoiceTotal(invoices));             // 31000



//======================== 4 =========================//

const createPayment = ({ phone = 0, internet = 0, amount = 0 } = {}) => ({
  phone,
  internet,
  amount,
  total() {
    return this.amount || this.phone + this.internet;
  },
});

const paymentTotal = payments => payments.reduce((sum, payment) => sum + payment.total(), 0);

let payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone:    2000,
}));

payments.push(createPayment({
  phone:    1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount:   10000,
}));

p(paymentTotal(payments));             // 24000
p();






//======================== 5 =========================//

const createInvoice = ({ phone = 3000, internet = 5500 } = {}) => ({
  phone,
  internet,
  payments: [],
  total() {
    return this.phone + this.internet;
  },
  addPayment(...payments) {
    this.payments.push(...[].concat(...payments));
  },
  paymentTotal() {
    return this.payments.reduce((sum, payment) => sum + payment.total(), 0);
  },
  amountDue() {
    return this.total() - this.paymentTotal();
  },
});

// const invoiceTotal = invoices => invoices.reduce((sum, invoice) => sum + invoice.total(), 0);

let invoice  = createInvoice({
  phone:    1200,
  internet: 4000,
});

let payment1 = createPayment({
  amount:   2000,
});

let payment2 = createPayment({
  phone:    1000,
  internet: 1200,
});

let payment3 = createPayment({
  phone:    1000,
});

invoice.addPayment(payment1);
invoice.addPayment([payment2, payment3]);
p(invoice.amountDue());       // this should return 0



// const foo = (...args) => p(...[].concat(...args));

// foo(42);
// foo([1, 2, 3]);
// foo([payment1, payment2]);







    delete(id) {
      let index = list.indexOf(this.getTodoByID(id));
      if (index === -1) return 'Invalid index';
      list.splice(index, 1);
      return `The todo with the id ${id} has been deleted.`;
    },