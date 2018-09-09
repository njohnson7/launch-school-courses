# ch7_99_bottles.rb
# prints out lyrics to 99 bottles of beer on the wall



bottles = 99
while bottles > 1
  puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer."
  bottles -= 1
  if bottles == 1
    puts "Take one down and pass it around, #{bottles} bottle of beer on the wall."
    break
  end
  puts "Take one down and pass it around, #{bottles} bottles of beer on the wall."
end

puts "#{bottles} bottle of beer on the wall, #{bottles} bottle of beer."
bottles -= 1
puts "Take one down and pass it around, no more bottles of beer on the wall."

puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."



# Book solution:
num_at_start = 5
num_bot = proc { |n| "#{n} bottle#{n == 1 ? '' : 's'}" }
num_at_start.downto(2) do |num|
  puts "#{num_bot[num]} of beer on the wall, #{num_bot[num]} of beer!"
  puts "Take one down, pass it around, #{num_bot[num-1]} of beer on the wall!"
end
puts "#{num_bot[1]} of beer on the wall, #{num_bot[1]} of beer!"
puts "Take one down, pass it around, no more bottles of beer on the wall!"