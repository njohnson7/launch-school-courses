# easy3_01.rb

# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
p hello.hi # 'Hello' is printed to the terminal, nil is returned

# case 2:

hello = Hello.new
# p hello.bye # => NoMethodError
# This is because only Goodbye has a bye instance method, not Hello. Hello just
#  has a hi instance method and a greet instance method, inherited from Greeting
# Hello, nor its parent class Greeting have a bye method defined, so we get an
#  undefined method error

# case 3:

hello = Hello.new
# p hello.greet # => ArgumentError
# Because greet has to be passed one argument when it is called, as it has a
#  single non-optional parameter

# case 4:

hello = Hello.new
p hello.greet("Goodbye") # 'Goodbye' is printed out, nil is returned

# case 5:

p Hello.hi # NoMethodError (undefined method error)
# There is no class method called hi defined in the Hello class. hi is an
#  instance method. We would need to define a method called self.hi in either
#  Hello or its parent Greeting, in order to avoid this error.
