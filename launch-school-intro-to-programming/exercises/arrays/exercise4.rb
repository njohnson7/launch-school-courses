# exercise4.rb
# What does each method return in the following example?



arr = [15, 7, 18, 5, 12, 8, 5, 1]


# 1.

arr.index(5)
# => 3 because the index method returns the index of the first value that (n) is equal to, so since n = 5 in this case, it returns 3,
#  because the first location of the value 5 in arr is at index 3.


# 2.

arr.index[5]
# => NoMethodError: undefined method `[]' for #<Enumerator:...:index>...
#  It returns the above error because calling index on an array without an argument or block returns an Enumerator, and the [] method to
#  call an index of an array does not work on Enumerators.


# 3.

arr[5]
# => 8 because we are calling the [] method to return the element of arr located at index 5, which is 8 in this case.