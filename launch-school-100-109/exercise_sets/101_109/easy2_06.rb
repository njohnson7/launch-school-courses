# easy2_06.rb
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed
#  on separate lines.

(1..99).each { |n| puts n if n.odd? }
puts


# Repeat this exercise with a technique different from the one you just used.

1.upto(99) { |n| puts n if n % 2 == 1 }
