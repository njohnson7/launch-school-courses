# easy1_new_01_repeat_yourself.rb
# Write a method that takes two arguments, a string and a positive integer, and
# prints the string as many times as the integer indicates.

def repeat(str, num)
  num.times { puts str }
end

repeat('Hello', 3)
# Hello
# Hello
# Hello

repeat('Goodbye', 5 )
repeat('test', 0 )
