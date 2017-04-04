# They've chosen to grow grass, clover, radishes, and violets.

# To this end, they've put little styrofoam cups along the window sills, and
# planted one type of plant in each cup, choosing randomly from the available
# types of seeds.

# [window][window][window]
# ........................ # each dot represents a styrofoam cup
# ........................

# There are 12 children in the class:

#     Alice, Bob, Charlie, David,
#     Eve, Fred, Ginny, Harriet,
#     Ileana, Joseph, Kincaid, and Larry.

# Each child gets 4 cups, two on each row. The children are assigned to cups in
# alphabetical order.

# The following diagram represents Alice's plants:

# [window][window][window]
# VR......................
# RG......................

# So in the row nearest the window, she has a violet and a radish; in the row
# behind that, she has a radish and some grass.

# Your program will be given the plants from left-to-right starting with the row
# nearest the windows. From this, it should be able to determine which plants
# belong to which students.

# For example, if it's told that the garden looks like so:

# [window][window][window]
# VRCGVVRVCGGCCGVRGCVCGCGV
# VRCCCGCRRGVCGCRVVCVGCGCV

# Then if asked for Alice's plants, it should provide:

#     Violets, radishes, violets, radishes

# While asking for Bob's plants would yield:

#     Clover, grass, clover, clover





# class Garden
#   STUDENTS = %w[Alice Bob Charlie David Eve Fred
#                 Ginny Harriet Ileana Joseph Kincaid Larry]
#   PLANTS = { 'G' => :grass, 'C' => :clover, 'R' => :radishes, 'V' => :violets }

#   def initialize(diagram, students = STUDENTS)
#     plants = diagram.split.map { |row| row.scan(/(.)(.)/) }.transpose
#                     .map { |plants| plants.flatten.map { |plant| PLANTS[plant] } }
#     students.map(&:downcase).sort.each_with_index do |student, idx|
#       define_singleton_method(student) { plants[idx] }
#     end
#   end
# end







class Garden
  STUDENTS = %w[Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry]
  PLANTS = { 'G' => :grass, 'C' => :clover, 'R' => :radishes, 'V' => :violets }

  def initialize(diagram, students = STUDENTS)
    plants = diagram.split.map { |row| row.scan(/(.)(.)/) }.transpose.map(&:flatten)
    students.map(&:downcase).sort.each_with_index do |student, idx|
      define_singleton_method(student) { plants[idx].map { |plant| PLANTS[plant] } }
    end
  end
end



class Garden
  PLANTS = { 'G' => :grass, 'C' => :clover, 'R' => :radishes, 'V' => :violets }

  def initialize(diagram, students = [*'a'..'z'])
    @students = students.sort.map { |student| student[0].downcase }
    @plants = diagram.split.map { |row| row.scan(/(.)(.)/) }.transpose.map(&:flatten)
  end

  def method_missing(name)
    @plants[@students.index(name[0])].map { |plant| PLANTS[plant] }
  end
end




a = 7

def my_value(b)
  a = b
end

my_value(a + 5)
puts a

# On line 1, a local variable named 'a' is initialized in the main scope with a Fixnum integer 7 object.
# On line 3, a method #my_value is defined which also defines one parameter named b.
# On line 7, #my_value is invoked, passing in the return value of the operation a + 5 as an argument.
# =>  (a + 5 is technically a method call, as explained below, although it might be okay to call it an operation too)
# The + operator is called on a (Fixnum integer 7 object), passing in Fixnum integer 5 object as an argument, which returns Fixnum integer 12.
# =>  (The + operator is actually a 'fake' operator, meaning that it looks like an operator, but is actually an instance method of the Fixnum class, Fixnum#+)
# At the original point of invocation on line 7, the return value of Fixnum integer 12 object from the previous operation is passed
#   by value as an argument into #my_value where it is now bound to the variable b.
# =>  (method local variable b would be more precise)
# On line 4, a local variable named a, scoped to the body of the method #my_value, is initialized with the value of b, returning a Fixnum integer 12 object as a return value.
# =>  (This sounds pretty good, but I might say something like, .....the object that b is pointing to is assigned to the method local variable a, so now
#      they are both pointing to the same object....., just to emphasize that the two local variables now both point to the same object )
# On line 5, the keyword end denotes the termination of the method #my_value, returning the return value of the previous line, Fixnum integer 12
#   object, at the original point of invocation on line 7.
# =>  (maybe add something about why 12 is returned (because it is the last expression that was evaluated in the method))
# =>  (also you might want to mention that this return value is not used or stored at all, so that's why the next line will output 7 instead of 12)
# On line 8, #puts is invoked, passing by value the local variable a in the main scope, Fixnum integer object 7, as an argument.
# The #puts method then outputs the value of a, 7, to the screen and returns nil.
# => (probably not necessary for 109, but it might be impressive on the assessment if you said Kernel#puts instead of just #puts)
# => (and if you want to be really precise, you could say that Kernel#puts calls Fixnum#to_s on 7, before outputting it to the screen)
