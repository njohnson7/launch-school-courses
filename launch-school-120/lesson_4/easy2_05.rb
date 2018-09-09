# easy2_05.rb

# There are a number of variables listed below. What are the different types and
# how do you know which is which?

excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"

# excited dog is a local variable, @excited_dog is an instance variable, and
#  @@excited_dog is a class variable. We can tell this because these 3 types
#  of variables are all written in snake_case and differentiated by @ symbols.
#  0 @'s is a local variable, 1 @ is an instance variable, and 2 @'s is a class
#  variable. These three variables point to 3 different String objects, all with
#  the same value.
