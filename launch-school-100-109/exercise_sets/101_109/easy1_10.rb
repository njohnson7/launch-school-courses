# easy1_10.rb
# What will the following code print, and why?

a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a

# This code will result in a NoMethodError, because since methods are
#  self-contained, the my_value method has no access to the top level a
#  variable. Therefore, when we try to increment a using the += operator, the
#  interpreter doesn't know what a is, which results in a NoMethodError.
