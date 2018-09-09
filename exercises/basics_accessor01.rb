# basics_accessor01.rb


# Reading and Writing

# Add the appropriate accessor methods to the following code.

# class Person
# end

# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name

# Expected output:

# Jessica



# class Person
#   attr_accessor :name
# end

# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name



# Alternate solution:
Person = Struct.new(:name)

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
puts

p Person.ancestors
p person1.class
p Class.class
p Struct.class
p Person.instance_methods
puts

Person2 = Class.new { attr_accessor :name }
p Person2.instance_methods
p person1.instance_variables

bob = Person2.new
p bob.instance_variables
bob.name = 'bob'
p bob.instance_variables
puts

class Person3 < Struct.new(:name) # bad practice!
end

p Person3.ancestors
fred = Person3.new
p fred.class
fred.name = 'fred'
p fred.name
p fred.instance_variables
