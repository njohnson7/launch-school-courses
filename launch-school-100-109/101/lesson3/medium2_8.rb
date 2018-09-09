# medium2_8.rb

# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the output of this code:

bar(foo)

# bar(foo) will return 'no'.
# This is because the foo method always returns 'yes'. It has a default
# parameter of 'no', but the this doesn't affect its return value, so it will
# always return 'yes' no matter what value is passed in to it.
# Therefore bar(foo) can be rewritten as bar('yes'). The bar method has a
# default parameter of 'no', but the param variable only gets assigned 'no' if
# no arguments are passed in to bar when it is called. Since 'yes' is being
# passed into bar in this case, param is equal to 'yes', and therefore param is
# not equal to 'no', so the code on the right side of the : in the ternary
# operator gets returned, which is 'no'.
