# easy1_04.rb

# If we have a class AngryCat how do we create a new instance of this class?

# The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

chester = AngryCat.new
chester.hiss

# We instantiate a new instance of the AngryCat class by calling Class#new on
#  AngryCat, which creates a new instance and executes the class's initialize
#  method if there is one (in this case there is not). In the code above, we
#  define a new instance of the AngryCat class, and assign that object to the
#  variable called chester. We can now call instance methods on chester.
