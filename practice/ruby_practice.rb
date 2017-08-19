


# # either one could be `nil`, and we want to avoid raising an error:
# a = 'abc'      # => 'abc'
# b = nil        # => nil

# # normally calling `upcase` on `nil` will raise an error:
# a.upcase       # => 'ABC'
# b.upcase       # ~> NoMethodError: undefined method `capitalize' for nil:NilClass

# # the expression on the right will only execute if the left operand is truthy:
# a && a.upcase  # => 'ABC'
# b && b.upcase  # => nil

# # using Safe Navigation Operator ('lonely operator') - shorthand for the above:
# a&.upcase      # => 'ABC'
# b&.upcase      # => nil



'123456'.chars.take(0) # []
'123456'.chars.drop(0) # ["1", "2", "3", "4", "5", "6"]

'123456'.chars.take(1) # ["1"]
'123456'.chars.drop(1) # ["2", "3", "4", "5", "6"]

'123456'.chars.take(2) # ["1", "2"]
'123456'.chars.drop(2) # ["3", "4", "5", "6"]

'123456'.chars.take(3) # ["1", "2", "3"]
'123456'.chars.drop(3) # ["4", "5", "6"]

'123456'.chars.take(4) # ["1", "2", "3", "4"]
'123456'.chars.drop(4) # ["5", "6"]

'123456'.chars.take(5) # ["1", "2", "3", "4", "5"]
'123456'.chars.drop(5) # ["6"]

'123456'.chars.take(6) # ["1", "2", "3", "4", "5", "6"]
'123456'.chars.drop(6) # []