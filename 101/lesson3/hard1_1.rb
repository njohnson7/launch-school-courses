# hard1_1.rb

# What do you expect to happen when the greeting variable is referenced in the
# last line of the code below?

if false
  greeting = “hello world”
end

greeting

# I would expect to get a NameError - uninitialized local variable or method
# `greeting'. This is because the greeting variable is initialized under the if
# statement, which only gets executed if the condition is false. Since 'false'
# is explicitly written in the if statement, there is nothing that could ever
# make it true, and therefore the following code will never be executed, and
# the greeting variable will never be initialized.

# As it turns out, after running the code, I found out that when the greeting
# variable is referenced, the return value is nil. This is because any local
# variables that get initialized within an if block that doesn't get executed
# will be assigned a value of nil. So they're still initialized, they just have
# no value. Therefore, this code doesn't give a NameError like I had expected.
