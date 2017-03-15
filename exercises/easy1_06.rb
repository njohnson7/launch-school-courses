a = 7

def my_value(b)
  b += 10
end

my_value(a)
puts a

# 1. On line 1, a local variable called a, within the main scope (also called top-level scope)
#   is being initialized (or defined), and assigned an Integer object with a value of 7.
# 2. On line 3, a method called my_value is defined, which also defines one parameter called b.
#    (not sure if 'defines' is the right term for parameters, but I don't know what
#     would be better though.)
# 3. On line 4, local variable b within the scope of the method simultaneously has 10 added to the original value of 7,
# and the result of 17 is assigned to the local variable b.
#   (I think I would wait until I would wait until after you talk about line 7, before
#    talking about what happens inside this method, because the code within
#    the method doesn't get executed until after the method is called.)
# 4. The completion of the method definition is denoted on line 5 with the reserved word end.
# 5. On line 7, the method my_value is called, passing in local variable a as an argument into the method,
# taking the place of the method's parameter, b.
#   (Instead of 'taking the place', I would describe the last part as: the local
#    variable in the outer scope, a, is passed into the my_value method, and the object it is referencing,
#    an instance of the Integer class with a value of 7, is assigned to the method
#    local variable b)
# (5.5: Now I would talk about what happens inside of the method. Something like:
#       The method local variable b is incremented by 10, reassigning it to a value
#       of 17. ) (Or if you want to be more specific: we reassign the method local
#       variable b by calling Integer#+ on the value b references, the Integer 7, and passing
#       in an argument of the Integer 10, which returns a value of the Integer 17, and then
#       we change the binding of b to this returned value using assignment.)
#    (Maybe I went a little overboard there...)
#   Execution continues to line 5, where it reaches the end of the method definition,
#   signified by the end keyword, and so the method returns the return value of the last expression
#   evaluated, which is an Integer with a value of 17. So the method call in line 7
#   returns 17, but we don't do anything with this returned value.
#    (definitely say something about what the method returns.)
# 6. On line 8, the method Kernel::puts is called, passing in the local variable a as an argument into the method.
# The value of a, 7, is outputted to the screen, and the method returns nil.
#  (maybe add something about: puts calls Integer#to_s on the value referenced by a before
#   outputting to the screen.)



a = 7

def my_value(a)
  a += 10
end

my_value(a)
puts a

# On line 1, an integer value of 7 is assigned to local variable a (maybe say something about a also being initialized here)
# On line 3, a method called my_value is defined which also defines one parameter called a (see notes in first example)
# On line 4, within the body and (maybe inner scope? not sure if this is the right term for a method's scope)
#  scope of the my_value method definition, we take the value of local variable a,
# add 10 to it, and reassign a to the result of that operation. (I would avoid using 'result',
#  and instead say something like 'the return value') Numbers are immutable in Ruby, unlike strings.
# On line 7, we invoke the method my_value, and pass local variable a as an argument,
#  (we aren't actually passing in the local variable a, but instead the object in memory that a is pointing to, 7.)
# (Also, as I mentioned above, since the code in line 4 isn't executed until after we call
#  the method on line 7, so it might make more sense to talk about the code in the order of execution.)
# which is then assigned to its formal argument.
#  (Not sure about the term 'formal argument', I've never seen it used before that
#   I can remember. Instead, I would say something like: the method local variable a is assigned a value of 7)
# The method peforms the operation explained above, and returns the result.
#  (Maybe try to be more specific, like: the expression on line 7 is executed, which
#   as explained above, returns an Integer object with a value of 17, and since this
#   is the last expression of the method, the method also returns 17. )
# On line 8, we call Kernel::puts and pass in the local variable a as an argument.
# puts calls Integer#to_s on 7, outputting it to the screen, and returns nil
#   (Since these two examples are almost the same, apart from the name of the
#    method parameter, you might want to add something about how there will be
#    no difference in the value of the local variable a after either method is
#    called. Even though in the second example, the method local variable and the top level local variable
#    both share the same name of a, they actually have no relation to each other,
#    as method definitions have their own scope which is separate from other scopes,
#    so sharing this name does not have any significance.)