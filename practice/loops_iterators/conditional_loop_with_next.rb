# conditional_loop_with_next.rb



x = 0

while x <= 10
  if x == 3
    x += 1
    next        # next reserved word jumps from line it is on to next loop iteration w/o
                # executing the code beneath it
                    # use next here to avoid printing the number 3 in our loop
  elsif x.odd?
    puts x
  end
  x += 1
end
    # @> 1, 5, 7, 9