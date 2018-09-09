# exercise9.rb
# Given the hash h = { a: 1, b: 2, c: 3, d: 4 }
# 1. Get the value of key `:b`.
# 2. Add to this hash the key:value pair `{e:5}`
# 3. Remove all key:value pairs whose value is less than 3.5



h = { a: 1, b: 2, c: 3, d: 4 }

# 1. Get the value of key `:b`.
b_value = h[:b]
puts b_value

# 2. Add to this hash the key:value pair `{e:5}`
h[:e] = 5
puts h

# 3. Remove all key:value pairs whose value is less than 3.5
h.delete_if { |k, v| v < 3.5 }        # calls delete_if method on hash to delete any values less than 5
puts h