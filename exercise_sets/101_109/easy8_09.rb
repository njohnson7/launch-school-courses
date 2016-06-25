# easy8_09.rb
# Convert number to reversed array of digits

# Write a method that takes a positive integer as an argument and returns that
#  number with its digits reversed.

def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
puts


# Alternate solution:
def reversed_number(num)
  nums = []
  while num > 0
    num, remainder = num.divmod(10.0)
    nums.unshift(remainder)
  end
  nums.map.with_index { |n, i| n * "1e#{i}".to_f}.reduce(:+).to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1
