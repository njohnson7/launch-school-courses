# 02_classes_objects.rb

# 1. Given the below usage of the Person class, code the class definition.

class Person1
  attr_accessor :name

  def initialize(n)
    @name = n
  end
end

p bob = Person1.new('bob')
p bob.name                  # => 'bob'
p bob.name = 'Robert'
p bob.name                  # => 'Robert'
puts





# 2. Modify the class definition from above to facilitate the following methods.
#     Note that there is no name= setter method now.

class Person2
  attr_reader :first_name
  attr_accessor :last_name

  # def initialize(first, last = '')
  #   @first_name = first
  #   @last_name = last
  # end

  def initialize(full_name)
    @first_name, @last_name = "#{full_name} ".split(' ', -1).map(&:to_s)
  end

  def name
    # "#{@first_name}#{' ' + @last_name unless @last_name.empty?}"
    "#{first_name} #{last_name}".strip
  end
end


p bob = Person2.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'
puts






# 3. Now create a smart name= method that can take just a first name or a full
#     name, and knows how to set the first_name and last_name appropriately.

# NO GOOD - FIXED BELOW:
# class Person3
#   attr_reader :name
#   attr_accessor :first_name, :last_name

#   def initialize(full_name)
#     # name=(full_name)  # DOESN'T WORK FOR SOME REASON!?
#     parse_full_name(full_name)
#   end

#   def name=(full_name)
#     parse_full_name(full_name)
#   end

#   private

#   def parse_full_name(full_name)
#     @name = full_name
#     self.first_name, self.last_name = "#{name} ".split(' ', -1)
#   end

# end


# GOOD VERSION:
class Person3
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    self.name=(full_name)
  end

  def name=(full_name)
    self.first_name, self.last_name = "#{full_name} ".split(' ', -1)
  end

  # custom getter method for dynamic display of name, so that when last_name
  #  is set, a call to .name returns the updated full name
  def name
    "#{first_name} #{last_name}".strip
  end
end

p bob = Person3.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
p bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

p bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'
p bob.name
puts




# 4. Using the class definition from step #3, let's create a few more people --
#     that is, Person objects.

# If we're trying to determine whether the two objects contain the same name,
#  how can we compare the two objects?

class Person3
  def ==(other)
    name == other.name
  end
end

p bob = Person3.new('Robert Smith')
p rob = Person3.new('Robert Smith')
p fred = Person3.new('Fred Marley')

p bob == rob
p rob == bob
p fred == bob
p fred == rob
p rob == fred
p bob.equal?(rob)
p bob.eql?(rob)
bob_copy = bob.dup
p bob_copy == bob
p bob_copy.eql?(bob)
p bob_copy.equal?(bob)
puts



# 5. Continuing with our Person class definition, what does the below print out?

bob = Person3.new("Robert Smith")
puts "The person's name is: #{bob}"
p bob
puts bob

# it will print out the object information of the bob instance of
#  the Person class as a String

class Person3
  def to_s
    name
  end
end

bob = Person3.new("Robert Smith")
puts "The person's name is: #{bob}"
p bob
puts bob
puts

# Due to method overriding, interpolating the bob variable will now print out
#  the string referenced by the @name member field of the bob instance



# PRACTICE:
class Test
  # attr_reader :something
  attr_accessor :something
  @@class_var = 'class_var'
  p @@class_var
  @something = 'something'
  p @something
  def initialize
    @name = 'test'
  end
end

test = Test.new
p test
p test.instance_eval { @name }
p test.instance_eval { @something }
p Test.class_eval { @something }
# p Test.class_eval { @@class_var }