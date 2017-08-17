


# either one could be `nil`, and we want to avoid raising an error:
a = 'abc'      # => 'abc'
b = nil        # => nil

# normally calling `upcase` on `nil` will raise an error:
a.upcase       # => 'ABC'
b.upcase       # ~> NoMethodError: undefined method `capitalize' for nil:NilClass

# the expression on the right will only execute if the left operand is truthy:
a && a.upcase  # => 'ABC'
b && b.upcase  # => nil

# using Safe Navigation Operator ('lonely operator') - shorthand for the above:
a&.upcase      # => 'ABC'
b&.upcase      # => nil


