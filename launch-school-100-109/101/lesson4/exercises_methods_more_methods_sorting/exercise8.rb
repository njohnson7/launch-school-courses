# exercise8.rb

# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# .take gets passed an integer n as an argument, and selects the first n
#  elements of a collection, returning them in a new array. It is not
#  destructive, as the original object it is called on is not modified. We can
#  verify this by testing it in irb, and adding a line after .take is called
#  that outputs the original object it was called on, and seeing that it was not
#  mutated. Also we can read the docs and notice that the signature of .take
#  shows that the return value is new_ary, and not ary, indicating that the
#  original array is not modified.