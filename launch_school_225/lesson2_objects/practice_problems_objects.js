/*
- remove first colon from title "Practice: Problems"
- " they should [be] 550 and 187.50, respectively."
- missing trailing commas in object literals
- function keyword spacing
- `++` operator
- var declarations at top of scope
- double quoted strings in code
*/

//======================== 1 =========================//

let invoices = { unpaid: [] };
p(invoices);

//======================== 2 =========================//

invoices.add = function (name, amount) {
  this.unpaid.push({ name, amount });
};

invoices.add('Starbucks', 300);
p(invoices.unpaid);

//======================== 3 =========================//

invoices.totalDue = function () {
  return this.unpaid.reduce((sum, { amount } ) => sum + amount, 0);
};

invoices.add('Bob', 900);
invoices.add('Fred', 100);
p(invoices.totalDue());

//======================== 4 =========================//

invoices.unpaid = [];
invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);
p(invoices);
p(invoices.totalDue());
p();

//======================== 5 =========================//

invoices.paid = [];
invoices.payInvoice = function (name) {
  this.paid.push(...this.unpaid.filter(invoice => invoice.name === name));
  this.unpaid = this.unpaid.filter(invoice => invoice.name !== name);
};

invoices.payInvoice('Slough Digital');
p(invoices);
p(invoices.totalDue());

//======================== 6 =========================//

invoices.totalPaid = function () {
  return this.paid.reduce((sum, { amount }) => sum + amount, 0);
};

p(invoices.totalPaid());
p();

//======================== 7 =========================//

invoices.add('Slough Digital', 300);
invoices.paid = [];
invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
p(invoices);
p(invoices.totalPaid());
p(invoices.totalDue());
