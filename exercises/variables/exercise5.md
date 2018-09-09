# Exercise 5



First case:

The puts x expression prints 3 to screen, because x originally was equal to 0, 
  but the 3.times do command along with the += operator incrementally added 1
  to x 3 times in a row, making x = 3 (0 + 1 + 1 + 1 = 3).
There is no error in this case.


Second case:

If these two snippets of code are from the same ruby file or irb session, then x will output
  3 again, like in the first case, as y is equal to 3 after 1 is added to it 3 times, and if
  x = y, then x = 3.
However, if these two snippets of code are from two different ruby files or two different irb
  sessions, then the x will output an error message, because it was only defined within the
  scope of the block following the 3.times do method invocation. Therefore, since x is a local
  variable, constrained to the scope of the do/end block, it cannot be used outside of that
  block. It must be declared before the do/end block for puts x to return a value and avoid
  getting an error message. Then the value of the x variable could be changed within the do/end
  block and be able to be used outside of that block. 
