# medium2_08_next_featured_number.rb
# Next Featured Number Higher than a Given Value

# A featured number (something unique to this exercise) is an odd number that is
# a multiple of 7, and whose digits occur exactly once each. So, for example, 49
# is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
# multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the
# next featured number that is greater than the argument. Issue an error message
# if there is no next featured number.

def featured(num)
  n = num + 1
  until n % 7 == 0 && n.odd? && n.to_s.size == n.to_s.chars.uniq.size
    n += 1
    if n >= 9_876_543_210
      return "Error: No featured numbers above #{num} exist."
    end
  end
  n
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those
                          #     requirements
puts


# Alternate solution:
def featured(num)
  n = num
  loop do
    n += 1
    break if n >= 9_876_543_210
    if n % 7 == 0
      if n.odd?
        return n if n.to_s.size == n.to_s.chars.uniq.size
      end
    end
  end
  "Error: No featured numbers above #{num} exist."
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those
                          #     requirements
puts


# Book solution:
def featured(num)
  n = num + 1
  n += 1 until n.odd? && n % 7 == 0
  loop do
    chars = n.to_s.chars
    return n if chars.uniq == chars
    n += 14
    break if n >= 9_876_543_210
  end
  "Error: No featured numbers above #{num} exist."
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those
                          #     requirements
