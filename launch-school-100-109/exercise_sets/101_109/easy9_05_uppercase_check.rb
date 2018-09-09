# easy9_05_uppercase_check.rb
# Uppercase Check

# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.

def uppercase?(str)
  !(str =~ /[a-z]/)
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
p uppercase?('444') == true


# Food for thought: in our examples, we show that uppercase? should return true
# if the argument is an empty string. Would it make sense to return false
# instead? Why or why not?

# It makes more sense as is, because the prompt asks for a method that checks
#  whether or not all the alphabetic characters are uppercase, and returns true
#  or false accordingly. So the method should only return false if both of the
#  following are true: the string has alphabetic characters, and one or more
#  of those characters is not uppercase. Since non-alphabetic characters are
#  ignored, then it should return true if no alphabetic characters are present.
