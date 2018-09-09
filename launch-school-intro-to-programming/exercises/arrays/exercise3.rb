# exercise3.rb
# How do you print the word "example" from the following array?



arr = [["test", "hello", "world"],["example", "mem"]]

# Solution 1 - prints the word "example" from the above array, by first calling the last method to bring up the second nested array,
#  and then by calling the first method to return the first element in the second nested array
puts arr.last.first


# Solution 2 - prints out "example" by using index values to first get the nested array located at index 1 of arr, and then gets the
#  string "example" located at index 0 of the 2nd nested array in arr.
puts arr[1][0]