# easy1_08.rb
# What will the following code print, and why?

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# This code will result in a NameError, because local variables initialized in
#  a block's inner scope are not accessible outside of the block, so when we
#  try to puts a, the interpreter doesn't know what a is, since it cannot access
#  the a inside of the do/end block, and there is no other a in the program.
