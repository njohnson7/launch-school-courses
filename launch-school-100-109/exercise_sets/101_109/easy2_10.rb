# easy2_10.rb
# Mutation

# What will the following code print, and why?

array1 = %w(Moe Larry Curly Chemp Harpo Chico Groucho Zeppo)
array2 = []

array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C') }

puts array2

# This will print out:
# Moe
# Larry
# CURLY
# CHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# This is because the first time we call Array#each on array1, we are pushing
#  each element of array1 to array2. Each element of both arrays is now pointing
#  to the same object in memory, so if we mutate an element in one of the
#  arrays, then the corresponding element in the other array will also be
#  changed, since they are both pointing to the same object. Therefore, the
#  second time we call each on array1, we are calling upcase! on elements that
#  start with 'C', which mutates the elements in both arrays.

# This feature in Ruby can get you in trouble when you intentionally mutate
#  a variable, but you don't realize that another variable points to the same
#  object, and you didn't want both variables to be modified. You can avoid this
#  problem by using mutating methods only when strictly necessary, and making
#  sure that only one variable is pointing to the object you want to mutate.
