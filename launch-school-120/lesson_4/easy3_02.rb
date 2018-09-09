# easy3_02.rb

# In the last question we had the following classes:

class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

# If we call Hello.hi we get an error message. How would you fix this?

# We can fix this by prepending the self keyword to to the name of the hi
#  method, which will define it as a class method, instead of an instance method,
#  like how it is currently defined. Since the hi method calls the greet method,
#  which is also an instance method, we would also have to prepend self to the
#  greet method in Greeting in order to avoid raising an error, because when a
#  method is called from a class method, Ruby assumes that the caleld method is
#  also a class method.
