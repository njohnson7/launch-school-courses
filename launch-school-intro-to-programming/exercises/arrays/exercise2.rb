# exercise2.rb
# What do the following programs return? What is the value of arr after each?



# 1.

arr = ["b", "a"]
arr = arr.product(Array(1..3))        # Array(1..3) = [1, 2, 3]
                                      #  arr.product([1, 2, 3]) => [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
arr.first.delete(arr.first.last)        # arr.first => ["b", 1]
                                        # arr.first.last => 1
# ["b", 1].delete(1) => 1
#  arr.first.delete(arr.first.last) => 1
# arr = [["b"], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a", 3]]
#  because the delete method with the argument 1 on the first value of arr deletes 1 from ["b", 1] and returns 1 while permanently
#  removing 1 from the first value (["b", 1]) of arr, by mutating the caller.


# 2.

arr = ["b", "a"]
arr = arr.product([Array(1..3)])        # [Array(1..3)] = [[1, 2, 3]]
                                        #  arr.product([[1, 2, 3]]) => [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
arr.first.delete(arr.first.last)        # arr.first => ["b", [1, 2, 3]]
                                        # arr.first.last => [1, 2, 3]
# ["b", [1, 2, 3]].delete([1, 2, 3]) => [1, 2, 3]
#  arr.first.delete(arr.first.last) => [1, 2, 3]
# arr = [["b"], ["a", [1, 2, 3]]]
#  because the delete method with argument [1, 2, 3] called on the first value of arr removes [1, 2, 3] from ["b", [1, 2, 3]], returning
#  [1, 2, 3], and permanently modifies arr to [["b"], ["a", [1, 2, 3]]] because delete is a destructive method.



# VIDEO NOTES:
# first element is modified