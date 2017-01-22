# exercise5.rb

# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift


# .shift will permanently remove the first key value pair of hash and return it as a 2
#  item array, [:a, 'ant']. If the hash was empty, it would return the hash's
#  default value. We can find out by testing it in irb or reading the docs.