/*
- WHOLE COURSE: newlines after object method definitions...?

___

- trailing commas
- function keyword spacing
- make endings of each question consistent with either a `.` or `:`
- newline after `if` block (#3, #4, #5, etc...)

___

- rephrase after semicolon: "example code; you must write code that satisfies them."
- #2: unclear: "Add it to the account's balance, and return the ***same amount***."
- #3: remove highlight from `},` line (after `deposit` definition)
- #4:
  - lowercase: "Array" and "Object"
  - maybe change `[Object]` to `[{…}]` (also #7, etc...)
  - spacing of returned object braces, and object braces in Solution (x2) (also #5, etc...)
  - double quoted strings in Solution (also #5, etc...)
  - remove `Object` from: `Object {type: "deposit", amount: 23}` (also #7)
- #5: remove semicolon after `makeAccount` declaration (also #6, #8)
- #7:
  - wrap "101" in backticks
  - maybe rephrase: "Each new account should have a unique account number, starting at 101; each account number should be one greater than the previous account created."
  - reformat: `Object {number: 101, balance: 0, transactions: Array[0]}`
  - highlight changed line in `makeAccount`
  - remove highlight from `},` line (also #8)
- #9:
  - missing semicolon: `> account.balance()`
  - variable name randomly changed from `number`: `var nextId = this.accounts.length + 101;` (also #10)
- #9, #10: `makeBank` randomly changed to function expression instead of function declaration (needs semicolon now)
- #10: fix these four lines (`.accounts`, not `.transactions`; `= undefined`, `makebank.account`:
  ```
  > bank.transactions;
  undefined
  > bank.transactions();
  TypeError: makebank.account is not a function
  ```
*/
//============================================================================//

//======================== 1 =========================//

// let account = {
//   balance: 0,
// };

//======================== 2 =========================//

// account.deposit = function (amount) {
//   this.balance += amount;
//   return amount;
// };

// p(account.balance);        // 0
// p(account.deposit(42));    // 42
// p(account.balance);        // 42
// p();

//======================== 3 =========================//

// account.withdraw = function (amount) {
//   amount = Math.min(this.balance, amount);
//   this.balance -= amount;
//   return amount;
// };

// account.balance = 100;
// p(account.balance);        // 100
// p(account.withdraw(19));   // 19
// p(account.balance);        // 81
// p(account.withdraw(91));   // 81
// p(account.balance);        // 0

//======================== 4 =========================//

// let account = {
//   balance: 0,
//   transactions: [],
//   deposit(amount) {
//     this.balance += amount;
//     this.transactions.push({ type: 'deposit', amount });
//     return amount;
//   },
//   withdraw(amount) {
//     amount = Math.min(this.balance, amount);
//     this.balance -= amount;
//     this.transactions.push({ type: 'withdraw', amount });
//     return amount;
//   },
// };

// p(account.deposit(23));        // 23
// p(account.withdraw(50));       // 23
// p(account.transactions);       // [Object]
// p(account.transactions[0]);    // Object { type: "deposit", amount: 23 }
// p(account.balance);            // 0

//======================== 5 =========================//

// const makeAccount = number => ({
//   number,
//   balance:      0,
//   transactions: [],
//   deposit(amount) {
//     this.balance += amount;
//     this.transactions.push({ type: 'deposit', amount });
//     return amount;
//   },
//   withdraw(amount) {
//     amount = Math.min(this.balance, amount);
//     this.balance -= amount;
//     this.transactions.push({ type: 'withdraw', amount });
//     return amount;
//   },
// });

// let account = makeAccount();
// p(account.deposit(15));                 // 15
// p(account.balance);                     // 15
// let otherAccount = makeAccount();
// p(otherAccount.balance);                // 0

//======================== 6 =========================//

// const makeBank = _ => ({
//   accounts: [],
// });

// let bank = makeBank();
// p(bank.accounts);          // []

//======================== 7 =========================//

// const makeBank = _ => ({
//   accounts:   [],
//   accountNum: 101,
//   openAccount() {
//     let account = makeAccount(this.accountNum++);
//     this.accounts.push(account);
//     return account;
//   },
// });

// let bank    = makeBank();
// let account = bank.openAccount();
// p(account.number);          // 101
// p(bank.accounts);           // [Object]
// p(bank.accounts[0]);        // Object { number: 101, balance: 0, transactions: Array[0] }

// let secondAccount = bank.openAccount();
// p(secondAccount.number);    // 102


//======================== 8 =========================//

// const makeBank = _ => ({
//   accounts:   [],
//   accountNum: 101,
//   openAccount() {
//     let account = makeAccount(this.accountNum++);
//     this.accounts.push(account);
//     return account;
//   },
//   transfer(source, destination, amount) {
//     return destination.deposit(source.withdraw(amount));
//   },
// });

// let bank   = makeBank();
// let source = bank.openAccount();
// p(source.deposit(10));                       // 10
// let destination = bank.openAccount();
// p(bank.transfer(source, destination, 7));    // 7
// p(source.balance);                           // 3
// p(destination.balance);                      // 7



//======================== 9 =========================//

// const makeBank = _ => {
//   const makeAccount = (number = 101) => {
//     let balance      = 0;
//     let transactions = [];
//     return {
//       deposit(amount) {
//         balance += amount;
//         transactions.push({ type: 'deposit', amount });
//         return amount;
//       },
//       withdraw(amount) {
//         amount = Math.min(balance, amount);
//         balance -= amount;
//         transactions.push({ type: 'withdraw', amount });
//         return amount;
//       },
//       getNumber() {
//         return number;
//       },
//       getBalance() {
//         return balance;
//       },
//       getTransactions() {
//         return transactions;
//       },
//     };
//   };

//   return {
//     accounts:   [],
//     accountNum: 101,
//     openAccount() {
//       let account = makeAccount(this.accountNum++);
//       this.accounts.push(account);
//       return account;
//     },
//     transfer(source, destination, amount) {
//       return destination.deposit(source.withdraw(amount));
//     },
//   };
// };

// let bank    = makeBank();
// let account = bank.openAccount();
// account.deposit(50);
// p(account.balance);                    // undefined
// p(account.getBalance());               // 50
// p(account.number);                     // undefined
// p(account.getNumber());                // 101
// p(account.transactions);               // undefined
// p(account.getTransactions());          // [{...}]
// p(account.getTransactions()[0]);       // [{ type: "deposit", amount: 50 }]
// p();

// let secondAccount = bank.openAccount();
// p(secondAccount.getNumber());          // 102
// p(secondAccount.getTransactions());    // []



//======================== 10 =========================//

const makeBank = _ => {
  const makeAccount = (number = 101) => {
    let balance      = 0;
    let transactions = [];
    return {
      deposit(amount) {
        balance += amount;
        transactions.push({ type: 'deposit', amount });
        return amount;
      },
      withdraw(amount) {
        amount = Math.min(balance, amount);
        balance -= amount;
        transactions.push({ type: 'withdraw', amount });
        return amount;
      },
      getNumber() {
        return number;
      },
      getBalance() {
        return balance;
      },
      getTransactions() {
        return transactions;
      },
    };
  };

  let accounts   = [];
  let accountNum = 101;
  return {
    openAccount() {
      let account = makeAccount(accountNum++);
      accounts.push(account);
      return account;
    },
    transfer(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    },
  };
};

let bank    = makeBank();
let account = bank.openAccount();
account.deposit(50);
p(account.balance);                      // undefined
p(account.getBalance());                 // 50
p(account.number);                       // undefined
p(account.getNumber());                  // 101
p(account.transactions);                 // undefined
p(account.getTransactions());            // [{...}]
p(account.getTransactions()[0]);         // [{ type: "deposit", amount: 50 }]
p();

let secondAccount = bank.openAccount();
p(secondAccount.getNumber());            // 102
p(secondAccount.getTransactions());      // []
p();

p(bank.accounts);                        // undefined
p(bank.accounts());                      // TypeError
