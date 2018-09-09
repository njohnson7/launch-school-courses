# exercise8.rb
# If you see this error, what do you suspect is the most likely problem?
#   NoMethodError: undefined method `keys' for Array

# Answer:
#  B. There is no method called keys for Array objects
#    We must have been trying to call the keys method on an array, which is not possible because Array objects have no method called keys,
#     because they don't contain keys. The keys method has to be called on a Hash, which does contain keys and does have a keys method.
#     If you called keys on hash, it would return a list of the keys that the hash contained.