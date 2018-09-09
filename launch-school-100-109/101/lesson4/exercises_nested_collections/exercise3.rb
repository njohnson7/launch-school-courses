# exercise3.rb

# Given this code, what would be the final values of a and b? Try to work this
# out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a


# a is 2, b is [3, 8] because numbers are immutable so when we add 2 to arr[0],
#  it just reassigns the element at index 0 of arr to 4, but can't change a.
#  However, in the line arr[1][0] we are referencing the element at index 1 of
#  arr, which is the array [5, 8], an object in memory that both arr[1] and b
#  point to, so when we use element assignment to subtract a (2) from that
#  element, it modifies the array in memory that both of these variables are
#  pointing to.