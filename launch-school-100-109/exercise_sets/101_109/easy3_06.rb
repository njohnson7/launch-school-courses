# easy3_06.rb
# Exclusive Or

# The || operator returns true if either or both of its operands are true,
#  false if both operands are false. The && operator returns true if both of
#  its operands are true, and false if either operand is false. This works great
#  until you need only one of two conditions to be true, the so-called exclusive
#  or.

# In this exercise, you will write a method named xor that takes two arguments,
#  and returns true if exactly one of its arguments is true, false otherwise.

# Examples:

# xor?(5.even?, 4.even?) == true
# xor?(5.odd?, 4.odd?) == true
# xor?(5.odd?, 4.even?) == false
# xor?(5.even?, 4.odd?) == false

def xor?(boolean1, boolean2)
  (boolean1 && !boolean2) || (boolean2 && !boolean1)
end


p xor?(5.even?, 4.even?) #== true
p xor?(5.odd?, 4.odd?) #== true
p xor?(5.odd?, 4.even?) #== false
p xor?(5.even?, 4.odd?) #== false
p xor?(true, false) #== true
p xor?(true, true) #== false
p xor?(2, 3) #== false
p xor?(2, false) #== true
p xor?(false, 2) #== true
p xor?(true, 2) #== false
p xor?(true, 2) #== false
puts


# Alternate solution:
def xor?(boolean1, boolean2)
  !boolean1 ^ !boolean2
end

p xor?(5.even?, 4.even?) #== true
p xor?(5.odd?, 4.odd?) #== true
p xor?(5.odd?, 4.even?) #== false
p xor?(5.even?, 4.odd?) #== false
p xor?(true, false) #== true
p xor?(true, true) #== false
p xor?(2, 3) #== false
p xor?(2, false) #== true
p xor?(false, 2) #== true
p xor?(true, 2) #== false
p xor?(true, 2) #== false
