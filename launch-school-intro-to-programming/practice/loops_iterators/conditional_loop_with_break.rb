# conditional_loop_with_break.rb
# break reserved word will exit loop immediately w/o executing any more code in the loop



x = 0

while x <= 10
  if x == 7
    break       # entire loop exits when the value of x reaches 7 in the loop
  elsif x.odd?
    puts x
  end
  x += 1
end
    # @> 1, 3, 5