# easy2_06.rb

# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would
# you call a class method?


# self.manufacturer is a class method, whereas model is an instance method.
# We can tell this because self.manufacturer is has self. appended to the name
#  of the method, which indicates that it is a class method, because self here
#  refers to the current scope that the method is defined in, which is the class,
#  Television, so self is equivalent to Television. We call class methods on
#  the class itself, so we would write Television.manufacturer to call this
#  method. The model method doesn't have self prepended to it, so we know that
#  it is an instance method, which would be called on an instance of Television,
#  like, Television.new.model.
