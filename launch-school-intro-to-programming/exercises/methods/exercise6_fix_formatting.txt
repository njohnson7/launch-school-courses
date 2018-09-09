# Exercise 6 #



    ArgumentError: wrong number of arguments (1 for 2)
      from (irb):1:in `calculate_product'
      from (irb):4
      from /Users/username/.rvm/rubies/ruby-2.0.0-p353/bin/irb:12:in `<main>'


The above error message tells you that when you called the method calculate_product that was defined in line 1,
and called in line 4, you only called it using one argument for the parameter, instead of two.
The calculate_product method must have been defined using two parameters, so when you call it, you need to
put in two arguments, or else it won't be able to run.


An example code leading to this error could be the following:

def calculate_product(a, b)
  a * b
end

calculate_product(3)


To fix it, you would have to call the method like this:

calculate_product(3, 5)
=> 15



VIDEO NOTES:

The calculate_product method requires 2 arguments, but you only provided 1, so you are passing in the
wrong number of arguments.