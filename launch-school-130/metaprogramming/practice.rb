# constants are similar to directories and files in that:
  # constants are uniquely identified by their paths
  # constants are nested
X = 'a root level constant'
module M
  X = 'a constant in module M'
  class C
    X = 'a constant in class C'
    p X
    p M::X
    p ::X   # prepending :: provides the absolute path to the outer constant X
  end
end

p ::X
p X

puts



module MyModule
  MyConstant = 'Outer constant'
  class MyClass
    MyConstant = 'Inner constant'
  end
end


module Moj
  class Klass
    KONSTANT = 'a constant'
  end
  p Klass::KONSTANT    # => 'a constant'
end
p Moj::Klass::KONSTANT # => 'a constant'

puts


X = 'a root level constant'
module Moj
  X = 'a constant in Moj'
  class Klass
    X = 'a constant in Klass'
    p Klass.constants
    p ::X  # => ????
  end
end

puts



p Moj.constants   # => [:X, :Klass]
p Math.constants  # => [:DomainError, :PI, :E]


# p Module.constants

# both return an array of all the top level constants:
p Module.constants == Object.constants  # => true
# => [..., :Math, :Integer, :SyntaxError, :Object, :Module, ...]

puts


module M
  class C
    module M2
      p Module.nesting  # => [M::C::M2, M::C, M]
    end
  end
end

puts



p String.instance_methods == 'abc'.methods  # => true
p String.methods == 'abc'.methods           # => false

puts


p Class.instance_methods(false) # => [:new, :allocate, :superclass]

puts



class MyClass; end
my_class = MyClass

p MyClass
p my_class

puts




# attr_reader :no_var



# instantiating a var
# what happens when u call puts w/o custom to_s
# what happens when u call p
# maybe too many ivars and attr_accessors?
# inside the class DEFINTION (self)

class Tester
  3.times { p self }
end

t = Tester.new
p t

puts




class Dog
  def age
    @age = 5
  end
end

dog1 = Dog.new
dog2 = Dog.new

dog1.age

p dog1.instance_variables  # => [:@age]
p dog2.instance_variables  # => []


puts



module M; end
class C
  prepend M
end

class D < C; end

p D.ancestors

puts



module M1; end
module M2
  include M1    # when M2 also includes M1, it has no effect b/c M1 is already
end             #   in the chain of ancestors.
module M3       # a module can appear only once in the same chain of ancestors
  prepend M1
  include M2
end

p M3.ancestors  # => [M1, M3, M2]

puts



class MyClass
  def testing_self
    @var = 10       # an ivar of self
    my_method       # same as self.my_method
    self
  end

  def my_method
    @var = @var + 1
  end
end

obj = MyClass.new
p obj.testing_self
p obj

puts



class C
  def public_method
    self.private_method
  end
  private
  def private_method; end
end

# C.new.public_method
puts





module Printable
  def print
    puts 'print from Printable'
  end
end

module Document
  def print_to_screen
    print
  end

  def print
    puts 'print from Document'
  end
end
class Book
  include Document
  include Printable
end

b = Book.new
b.print_to_screen
puts



class MyClass
  def my_method
    "original my_method"
  end
  def another_method
    my_method
  end
end

module MyClassRefinement
  refine MyClass do
    def my_method
      "refined my_method"
    end
  end
end

using MyClassRefinement
p MyClass.new.my_method         # =>  "refined my_method"
p MyClass.new.another_method    # =>  "original my_method"
puts


# First, if you pass a block to Array#grep, the block is evaluated for each
#  element that matches the regular expression



class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts '(You also passed in a block)' if block_given?
  end
end

bob = Lawyer.new
bob.talk_simple('hello', 'there') { puts 'block!'}
puts




class Roulette
  def method_missing(name, *args)
    person = name.to_s.capitalize
    # number = nil
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{rand(1..10)}"
  end
end
# You can use the Roulette like this:

number_of = Roulette.new
puts number_of.bob
puts number_of.frank
# And here’s what the result is supposed to look like:

# <= 5...
#    6...
#    10...
#    Bob got a 3
#    7...
#    4...
#    3...
#    Frank got a 10



# blocks are a powerful tool for controlling scope, meaning which variables
#  and methods can be seen by which lines of code.
puts



def my_method
  x = 'goodbye'
  yield('cruel')
end

x = 'hello'
p my_method { |y| "#{x}, #{y} world" }
puts



def just_yield
  yield
end

top_level_var = 1
just_yield do
  top_level_var += 1
  local_to_block = 1
end

p top_level_var
# local_to_block
puts



v1 = 1
class Class1
  v2 = 2
  p local_variables

  def my_method
    v3 = 3
    local_variables
  end

  p local_variables
end

obj = Class1.new
p obj.my_method
p obj.my_method
p local_variables
puts


@var = 'top level @var'
def my_method
  @var
end

p my_method
puts


my_var = 'success'
class Class2
  # print var here...
  def my_method
    # ...and here
  end
end

# my_var is captured in a closure, and the closure is passed to the Class.new method
Class3 = Class.new do  # method call instead of a keyword
  p my_var
  define_method(:my_method) { p my_var }
end

obj = Class3.new
obj.my_method
puts


def define_methods
  shared = 0

  # Kernel method:
  Kernel.send(:define_method, :counter) { shared }
  Kernel.send(:define_method, :inc) { |x| shared += x }

  # Object method:
  # define_method(:counter) { shared }
  # define_method(:inc) { |x| shared += x }
end

define_methods
p counter
p inc(4)
p counter

m = method(:counter)
p m.owner
p m.receiver
puts



class Class4
  def initialize
    @v = 1
  end
end

obj = Class4.new
obj.instance_eval do
  p self
  p @v
end

v = 2
obj.instance_eval { @v = v }
p obj.instance_eval { @v }
puts



class Class5
  def initialize
    @x = 1
  end
end

class Class6
  def twisted_method
    @y = 2
    Class5.new.instance_eval { "@x: #{@x}, @y: #{@y}"}        # => "@x: 1, @y: "
    Class5.new.instance_exec(@y) { |y| "@x: #{@x}, @y: #{y}"} # => "@x: 1, @y: 2"
  end
end

obj = Class6.new
p obj.twisted_method
puts


# A Clean Room is just an environment where you can evaluate your blocks:
class CleanRoom
  def current_temperature
    1
  end
end

clean_room = CleanRoom.new
clean_room.instance_eval do
  if current_temperature < 20
    # TODO: wear jacket
  end
end
puts



def math(a, b)
  yield(a, b)
end

def do_math(a, b, &operation)
  p operation
  math(a, b, &operation)
end

p do_math(2, 3) { |x, y| x * y }  # => 6
puts


def my_method(&the_proc)  # converts the block that was passed to a proc
  the_proc
end

x = my_method { |name| "Hello, #{name}!" }
p x.class        # => Proc
p x.call('Bob')  # => "hello Bob!"
puts


def my_method(greeting)
  "#{greeting}, #{yield}!"
end

my_proc = proc { 'Bob' }
p my_method('Hello', &my_proc)  # & converts my_proc to a block, and passes block to method
puts



def double(callable_object)
  callable_object.call * 2
end

l = lambda { return 10 }
p double(l)
puts



class Class7
  def initialize(val)
    @x = val
  end

  def my_method
    @x
  end
end

obj = Class7.new(1)
m = obj.method(:my_method)
p m.call
puts



module Module1
  def my_method
    42
  end
end

p unbound = Module1.instance_method(:my_method)
p unbound.class         # => ???
String.send :define_method, :another_method, unbound
p 'abc'.another_method  # => ???
bound = unbound.bind(Array)
p bound.call            # => ???
puts






# FRIDAY CHAPTER---------------------------------------------------------


class Class8
  def my_method
    @x = 1
    binding
  end
end

b = Class8.new.my_method
p b                 # => #<Binding:0x00000002514e90>
p eval '@x', b      # => 1
p TOPLEVEL_BINDING  # => Binding obj of the top level scope
puts



class Class9
  def my_method
    eval 'self', TOPLEVEL_BINDING
  end
end

p Class9.new.my_method  # => main
puts



arr = %w[a b c]
x = 'd'
arr.instance_eval "self[1] = x"
p arr
puts



def explore_array(method)
  code = "%w[a b c].#{method}"
  puts "Evaluating: #{code}"
  eval code
end

# loop { p explore_array(gets) }
puts



def testing
  p 123
end

# 1.testing # private method `testing' called for 1:Integer (NoMethodError)
1.send(:testing) # outputs: 123
puts




# user_input = "User input: #{gets}"
# p user_input.tainted?  # => true
# puts



class String
  def self.inherited(subclass)
    puts "#{self} was inherited by #{subclass}"
  end
end

class MyString < String; end
class AnotherString < MyString; end
# <= String was inherited by MyString
# <= MyString was inherited by AnotherString
puts



module Mod10
  def self.included(other_mod)
    puts "Mod10 was included into #{other_mod}"
  end
end

module Mod11
  def self.prepended(other_mod)
    puts "Mod11 was prepended to #{other_mod}"
  end
end

class Class10
  include Mod10
  prepend Mod11
end

# <= Mod10 was included into Class10
# <= Mod11 was prepended to Class10
puts



module Mod12
  def self.method_added(method)
    puts "New method: Mod12##{method}"
  end

  def my_method; end
end
# <= New method: Mod12#my_method
puts



module Mod13; end

class Class13
  def self.include(*modules)
    puts "Called: Class13.include(#{modules})"
    super
  end

  include Mod13
end
# <= Called: Class13.include([Mod13])
puts



# TYPO!!____________________________________
class Class14
  attr_accessor :my_attribute

  def set_attribute(n)
    self.my_attribute = n
  end

  private :my_attribute    #!!!!!!!!!!
end

obj = Class14.new
obj.set_attribute 10
p obj.send :my_attribute
obj.my_attribute = 20
p obj.send :my_attribute
p obj.private_methods(false)
p obj.public_methods(false)
puts



class Object
  def tap
    yield self
    self
  end
end

p [1, 2, 3].map(&:next).tap { |arr| p arr }.shift.to_s
puts



# Symbol#to_proc
class Symbol
  def to_proc
    proc { |x| x.send(self) }
  end
end

p %w[a b c].map(&:capitalize.to_proc)
puts



def BaseClass(name)
  name == "string" ? String : Object
end
class Clz < BaseClass "string"  # a method that looks like a class
  attr_accessor :an_attribute  # a method that looks like a keyword
end
obj = Clz.new
obj.an_attribute = 1   # a method that looks like an attribute
puts



# TYPO!!____________________________________
module MyNamespace
  class Array
    def to_s
      "my class"
    end
  end
end
p Array.new # => []
p MyNamespace::Array.new # => my class   #!!!!!!!!!!
puts




# =====  Arguments are evaluated first  =====
# Each of the expressions below will evaluate its argument first,
# then it will evaluate itself. What will we see on eac line?

def call1(n)
  p n # => 0
  1 + n
end

def call2(n)
  p n # => 1
  n + 2
end

def call3(n)
  p n # => 3
  n + 3
end

p call3(
  call2(
    call1(0)  # =>
  )           # =>
)             # => 6
puts




# =====  Attr Whatevers  =====
# The attr_accessor (et all) define define methods that get/set the instance variables of the same name
class Fruit
  attr_accessor :apple

  def initialize(banana)
    @apple = banana
    self.apple = "#{banana} boat"
  end

  def pear
    @apple
  end
end

#*****
# What will we see on these two lines?
fruit = Fruit.new('orange')
p fruit.pear   # => 'orange boat'
p fruit.apple  # => 'orange boat'

# *****
# We can punch the object in the face and rearrange its guts with metaprogramming
# Here, I go into it and set @apple = 'pineapple'
# What will we see in the following expressions?
fruit.instance_variable_set '@apple', 'pineapple'
p fruit.pear  # => 'pineapple'
p fruit.apple # => 'pineapple'

fruit.apple = 'mango'
p fruit.pear  # => 'mango'
p fruit.apple # => 'mango'
puts
puts '---------'



# =====  Calling methods pushes bindings onto the callstack  =====
# We can see the callstack with the `caller` method.
def you_rang?
  # How many bindings are on the callstack?
  p caller.size # => 1

  # Where did we call it from?
  p caller # => ["practice.rb:823:in `<main>'"]
end
you_rang?

# What will we see, before and after the calls of each of these lines below?
def call1
  p ['call 1 first', caller.size]   # => 1
  call2
  p ['call 1 last', caller.size]   # => 1
end

def call2
  p ['call 2 first', caller.size]  # => 2
  call3
  p ['call 2 last', caller.size]   # => 2
end

def call3
  p ['call 3 first', caller.size]   # => 3
  "zomg".call4
  p ['call 3 last', caller.size]   # => 3
end

class String
  def call4
    p ['call 4', caller.size] # => 4
    p caller # => ["practice.rb:841:in `call3'", "practice.rb:835:in `call2'",
             #     "practice.rb:829:in `call1'", "practice.rb:853:in `<main>'"]
  end
end

p ['first', caller.size]     # => 0
call1
p ['last', caller.size]     # => 0
puts '---------'
puts





# =====  Chaining method calls  =====
# When we call a method, we call it on whatever the expression evaluates to
# This means that chaining methods leads to methods called on the return value
# of the previous expression

#*****
# What will this expression evaluate to?
p 'abc'.upcase.reverse.downcase.chars.first # => 'c'

#*****
# It doesn't matter if you split the expression across lines, what will we see?
p 'abc'       # =>
  .upcase   # =>
  .reverse  # =>
  .downcase # =>
  .chars    # =>
  .first    # => 'c'

#*****
# The dot can go on the preceeding line, or the current line
p 'abc'.      # =>
  upcase.   # =>
  reverse.  # =>
  downcase. # =>
  chars.    # =>
  first     # => 'c'

#*****
# We can get all funky with the dot (best practices, ya know?)
p 'abc'.              # =>
  upcase  .reverse  # =>
  .downcase.        # =>
  chars             # =>
.  first            # => 'c'
puts




# =====  Mixing and matching args and chaining  =====
#*****
# Uncomment each of the following lines, what will we see?
def z(a)
  p a + a # => 'abcabc'
end

def w(a)
  p a         # => 'ABCABC'
     .reverse # => 'CBACBA'
end

p (w (z 'abc').upcase).chars # => [ "C", "B", "A", "C", "B", "A" ]
puts




# =====  Silence!! DEstroy him!!  =====
# Dew! Bew! Dew-dew-dew! Bew!

module InSpace
  attr_reader :current_status
  def initialize(current_status, *whatevz)
    @current_status = current_status # => "Though one thing we have in common with the present is we still call it the present, even though its the future",
    super(*whatevz) # => "What you call 'the present', we call 'the past', so... you guys are way behind"
  end
end

class Human
  attr_reader :name
  def initialize(name)
    @name = name # => "What you call 'the present', we call 'the past', so... you guys are way behind"
  end
end

class Student < Human
  include InSpace
  attr_reader :lesson
  def initialize(lesson, *o_O)
    @lesson = lesson # =>  "The future is quite different to the present"
    super *o_O       # =>  "Though one thing we have in common with the present is we still call it the present, even though its the future",
                     #     "What you call 'the present', we call 'the past', so... you guys are way behind"
  end
end

students_in_space = Student.new(
  "The future is quite different to the present",
  "Though one thing we have in common with the present is we still call it the present, even though its the future",
  "What you call 'the present', we call 'the past', so... you guys are way behind"
)

#*****
# We used poisonous gasses, (with traces of lead)
# and we poisoned their asses (actually, their lungs)
p students_in_space.current_status # => "Though one thing we have in common with the present is we still call it the present, even though its the future",
p students_in_space.name           # => "What you call 'the present', we call 'the past', so... you guys are way behind"
puts






# =====  Instance Variables  =====
# An instance is a collection of instance variables with a pointer to its class,
# it is like the base of a linked list, pointing at the first node in the list
# (typically named "head")

# What will we see returned from 159?
class Fruit
  def initialize(banana)
    @apple = banana            # => 'orange'
    @pear  = "#{banana} boat"  # => 'orange boat'
  end

  def pear
    @apple  # => 'orange'
  end
end

fruit = Fruit.new('orange')
p fruit.pear  # => 'orange'
puts




# =====  The last line of a method is returned to the caller  =====

# *****
# What will we see returned from call1?
def call1
  call2  # => 222
  call3  # => 333
end

def call2
  222
end

def call3
  call4 # => 444
  333
end

def call4
  444
end

p call1 # => 333
puts




# ===== Classes are a linked list called inheritance  =====
# Get classy, stay super

class A
  def zomg
    'a'
  end
end

class B < A
  def zomg
    'b'
  end
end

class C1 < B
end

class D1 < A
end

# *****
# What will we see on each of these lines?
p A.new.zomg  # => 'a'
p B.new.zomg  # => 'b'
p C1.new.zomg # => 'b'
p D1.new.zomg # => 'a'
puts




# =====  Modules  =====
# When you include a module, it makes a class and inserts it into the hierarchy
class A
  def wat
    'a'
  end
end

module WatInTheWorld
  def wat
    '!?' + super
  end
end

class B < A
  include WatInTheWorld
  def wat
    'b' + super  # => 'b!?a'
  end
end

#*****
# What will we see here?
p B.new.wat # => 'b!?a'
puts




# =====  We can use super to access the definition in the superclass chain  =====
class C1
  def m
    '1'
  end
end

class C2 < C1
  def m
    super + '2'
  end
end

class C3 < C2
  def m
    super + '3'
  end
end

# *****
# What will we see on each of these lines?
p C1.new.m  # => '1'
p C2.new.m  # => '12'
p C3.new.m  # => '123'
puts




# =====  Once again, but with malice  =====
class W
  def zomg() '1' + wtf  end
  def wtf()  '2'        end
  def bbq()  '3'        end
end

class X1 < W
  def zomg() super      end
  def wtf()  '4' + bbq  end
  def bbq()  super      end
end

class Y < X1
  def zomg() '6' + super  end
  def wtf()  '7' + super  end
  def bbq()  '8' + super  end
end

#*****
p W.new.zomg  # => '12'
p X1.new.zomg  # => '143'
p Y.new.zomg  # => '617483'
puts




# =====  Toplevel methods are defined where?  =====
def rawr!
  "#{self} says: rawr!"
end
public :rawr!

# *****
# What class is rawr! defined in
p method(:rawr!).owner # => Object

# *****
# Think of some objects that inherit from this class
# and show you can call it on them
# <your example here>
p 1.rawr!
p 'abc'.rawr!
p [].rawr!
puts




# =====  What do bindings tell us?  =====

# Here we have a method that returns an object wrapping the binding it executed in
# We can evaluate code within the context of that binding to find out about it
def get_binding
  a = 123
  binding
end
b = get_binding

# *****
# What is self in that binding?
p b.eval 'self' # => main

# *****
# What are its local variables?
p b.eval 'local_variables' # => [:a]

# *****
# What is the value of a?
a = 99
p b.eval 'a' # => 123

# *****
# The binding tracks what `self` is, why does this matter?
# What will we see the second time we run this?
p b.eval 'instance_variables' # => []
@abc = 123
p b.eval 'instance_variables' # => [:@abc]
puts



module M12
  X1 = 42
  module M13
    p ::M12::X1  # => 42
  end
end
puts



class A4
  def get_c; C4 end
end

class B4 < A4
  module C4; end
end

# p B4.new.get_c
# NameError: uninitialized constant A4::C4
puts




require 'forwardable'

class RecordCollection
  attr_accessor :records
  extend Forwardable
  def_delegator :@records, :[], :record_number
  def_delegators :@records, :size, :<<, :map
end

r = RecordCollection.new
r.records = [1, 2, 3]
p r.record_number(0)  # => 1
p r.size              # => 3
p r << 4              # => [1, 2, 3, 4]
p r.map(&:abs2)       # => [1, 4, 9, 16]
# p r[3]              # => NoMethodError: undefined method `[]'
puts



def missing((first, *nums, last))
  "first number: #{first.inspect}, middle numbers: #{nums}, last number: #{last.inspect}"
end

p missing([-3, -2, 1, 5])
# => "first number: -3, middle numbers: [-2, 1], last number: 5"
p missing([1, 2, 3, 4])
# => "first number: 1, middle numbers: [2, 3], last number: 4"
p missing([1, 5])
# => "first number: 1, middle numbers: [], last number: 5"
p missing([6])
# => "first number: 6, middle numbers: [], last number: nil"
p missing([])
# => "first number: nil, middle numbers: [], last number: nil"
p missing(nil)
# => "first number: nil, middle numbers: [], last number: nil"

p nil.to_a           # => []
empty_array = *nil
p empty_array        # => []
{ a: [1, 2], b: [3, 4] }.each { |key, (x, y)| p "key: #{key}, x: #{x}, y: #{y}" }
# =>  "key: a, x: 1, y: 2"
#     "key: b, x: 3, y: 4"
arr = *1..10
p arr      # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# *1..10   # => SyntaxError  (doesn't work by itself)
# *nil     # => SyntaxError  (doesn't work by itself)

# without splat:
def missing((first, nums, last))
  "first number: #{first.inspect}, middle numbers: #{nums}, last number: #{last.inspect}"
end
p missing([-3, -2, 1, 5])
# => "first number: -3, middle numbers: -2, last number: 1"
# the last element is not assigned to any variable so it gets ignored