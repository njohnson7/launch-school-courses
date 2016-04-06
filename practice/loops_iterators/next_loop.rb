# next_loop.rb


i = 0
loop do
  i += 2
  if i == 4
    next        # skip rest of the code in this iteration
  end               # so this causes it to skip printing 4
                    # execution continued to the next iteration of the loop
  puts i
  if i == 10
    break
  end
end
    # @> 2, 6, 8, 10