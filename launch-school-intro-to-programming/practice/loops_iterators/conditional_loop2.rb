# conditional_loop2.rb



x = 0

while x <= 10
  if x.odd?       # uses the odd? method to decide if the current var in the loop is odd
    puts x        # if it is odd, then it prints to screen
                  # if not, it just increments x by 1 and continues thru loop
  end
  x += 1
end
    # @> 1, 3, 5, 7, 9