# exercise5.rb
# What is the value of a, b, and c in the following program?



string = "Welcome to America!"
a = string[6]       # a = "e"  because e is located at index 6 of the string, with W located at index 0.
b = string[11]      # b = "A"  becauause A is located at index 11 of the string.
c = string[19]      # c = nil  because the string only contains 19 characters total, and since its index starts at 0,  ! is at index 18 and
                    #  nothing is located at index 19.

# BOOK NOTES:
# when you reference an array index that is beyond the length of the array, ruby returns nil and doesn't throw an error