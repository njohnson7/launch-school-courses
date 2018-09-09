# easy1_01.rb

# Which of the following are objects in Ruby? If they are objects, how can you
# find out what class they belong to?

    # true
    # "hello"
    # [1, 2, 3, "happy days"]
    # 142

# They are all objects, and are all instances of a class.
# true is an instance of TrueClass.
# 'hello' is an instance of String class
# [1, 2, 3, 'happy days'] is an instance of Array class, and it contains three
#  instances of Fixnum class, and one instance of String class.
# 142 is an instance of Fixnum class, a subclass of Integer class.
# You can call the instance method Object#class on each of them, which will
#  return the class name they belong to as a constant. This works because they
#  are all subclasses of Object, so any instance method of Object can be called
#  on them.
