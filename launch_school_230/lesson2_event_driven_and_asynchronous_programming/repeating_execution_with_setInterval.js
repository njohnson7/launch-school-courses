/*
//======================== Repeating Execution with `setInterval` =========================//
- function keyword spacing
- backticks in comments
- periods/capitalization in comments

- double quoted strings in image
- semicolon: `  }, 1000)` (x2)

*/
//============================================================================//
//============================================================================//

//======================== 1, 2 =========================//

function startCounting() {
  let n = 1;
  return setInterval(_ => p(n++), 1000);
}

function stopCounting() {
  clearInterval(id);
}

let id = startCounting();
stopCounting(id);
