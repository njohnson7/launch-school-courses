# exercise7.rb
# Given the following code, what's the difference between the 2 hashes that were created?


x = "hi there"

# the symbol x (x:) is a key that corresponds to the string "some value. x is used as a symbol, not as a variable.
#  => {:x=>"some value"}
my_hash = {x: "some value"}

# the variable x ("hi there" string) is a key that corresponds to the string "some value". x is used as a variable to represent
#  the string, "hi there", not as a key.
#   => {"hi there"=>"some value"}
my_hash2 = {x => "some value"}



# VIDEO NOTES:
#  : colon means that x is not a local variable, but a symbol