/*
- function keyword spacing
- double quoted strings (in code and text)

___

- semicolon after return statement (x3)
- the function already logs, so this log is redundant; also isn't `=>` usually used for return values...?: `console.log(helloSteve());        // => "Hello, Steve!"`
- sentence fragment: "Specifically, after JavaScript garbage collects the function referenced by helloSteve."
*/
//============================================================================//

const makeHello = name => {
  let msg = `Hello, ${name}!`;
  return _ => p(msg);
};

let helloSteve = makeHello('Steve');

helloSteve();
