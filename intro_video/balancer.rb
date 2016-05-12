# balancer.rb
# write a method that takes a str, and returns a boolean indicating whether this string has
#  a balanced set of parentheses

# ---
# balancer("hi")        # => true
# balancer("(hi")       # => false
# balancer("(hi)")      # => true
# ---

# Bonus:

# ---
# balancer(")hi(")      # => false



def balancer(str)
  ary = str.split('')
  lcount = 0
  rcount = 0
  ary.each do |char|
    lcount += 1 if char == '('
    rcount += 1 if char == ')'
    return false if rcount > lcount       # bonus
  end
  lcount == rcount
end

puts balancer("hi")        # => true
puts balancer("(hi")       # => false
puts balancer("(hi)")      # => true

# Bonus:
puts balancer(")hi(")      # => false
puts balancer("()hi)")     # => false
puts balancer("(()))(")    # => false