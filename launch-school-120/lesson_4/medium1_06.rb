# medium1_06.rb

# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?


# In the create_template method, the first example directly assigns the
#  string to the @template instance variable, whereas the second example
#  calls the setter method created by attr_accessor, passing in the string
#  as an argument, and the setter method itself then assigns the string to the
#  @template instance variable.

# In the show_template method, both examples call the setter method created by
#  attr_accessor, which returns the object contained in the @template instance
#  variable. In the first example the template method is called without an
#  explicit receiver, but self is still the implicit receiver, since the
#  show_template method is an instance method which will be called on an
#  instance of Computer, so self here refers to an instance of Computer.
#  In the second example, self is prepended to the template method as an
#  explicit receiver. Both of these are evaluated in the exact same way by Ruby.