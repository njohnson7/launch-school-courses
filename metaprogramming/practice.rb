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
