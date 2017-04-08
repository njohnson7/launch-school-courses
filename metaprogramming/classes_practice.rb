class Class1
  puts 'hello'
end
# <= hello
puts



result = class Class1
  self
end
p result  # => Class1
puts



# class C
#   def m1
#     def m2; end
#   end
# end

# class D < C; end

# obj = D.new
# p C.instance_methods(false)  # => [:m1]
# obj.m1
# p C.instance_methods(false)  # => [:m1, :m2]
# puts



def add_method_to(a_class)
  a_class.class_eval do
    def my_method; 'hello!' end
  end
end

add_method_to(String)
p 'abc'.my_method
puts



class Class2
  @my_var = 1
  def self.read; @my_var     end
  def write;     @my_var = 2 end
  def read;      @my_var     end
end

obj = Class2.new
p Class2.read    # => 1
p obj.read       # => nil

obj.write
p Class2.read    # => 1
p obj.read       # => 2
puts



@@v = 1

class Class1
  @@v = 2
end

p @@v
puts



str = 'abc'

def str.title?
  self.upcase == self
end

p str.title?
p str.methods.grep(/title?/)
p str.singleton_methods
puts



obj = Object.new
singleton_class = class << obj
  p self
end
p singleton_class.class
def obj.my_singleton_method; end
p singleton_class.instance_methods(false)
puts



class << str
  def jump_around
    'jumps around!'
  end
end

p str.jump_around
p str.singleton_class
p 'xyz'.singleton_class
puts



class C
  def a_method
    'C#a_method'
  end
end

class D < C; end

obj = D.new
p obj.a_method

class << obj
  def a_singleton_method
    'obj#a_singleton_method'
  end
end

p obj.singleton_class.superclass  # => D
puts

class C
  class << self
    def a_class_method
      'C.a_class_method'
    end
  end
end

p D.singleton_class             # => #<Class:D>
p D.singleton_class.superclass  # => #<Class:C>
p D.singleton_class.ancestors
#  [#<Class:D>, #<Class:C>, #<Class:Object>, #<Class:BasicObject>,
#   Class, Module, Object, Kernel, BasicObject]
p D.a_class_method              # =>  "C.a_class_method"
puts

p C.singleton_class
p C.singleton_class.superclass
p C.singleton_class.ancestors
puts

p obj.singleton_class
p obj.singleton_class.superclass
p obj.singleton_class.ancestors
puts



p Class.singleton_class.ancestors
puts



module Moj2
  def self.crazy
    'crazy'
  end
end

class Class3
  def self.wtf
    'wtf'
  end
end

class Class4 < Class3
  include Moj2
end

p Class4.wtf
p Moj2.crazy
# p Class4.crazy
puts



s1, s2 = 'abc', 'def'
s1.instance_eval do
  def swoosh!; reverse end
end

p s1.swoosh!
# p s2.swoosh!
p s2.respond_to?(:swoosh!)
puts



module Mod5
  def my_method; 'hello' end
end

class Class5; end

class << Class5      # option 1
  include Mod5
end

Class5.extend(Mod5)  # option 2

p Class5.my_method
p Class5.singleton_methods  # => [:omg, :my_method]
puts


# class String
#   alias_method :real_length, :length

#   def length
#     real_length > 5 ? 'long' : 'short'
#   end
# end

# p 'war and peace'.length       # => "long"
# p 'war and peace'.real_length  # => 13
# puts



# module IntegerWrapper
#   def +(other)
#     super.next
#   end
# end

# Integer.class_eval { prepend IntegerWrapper }
# p 1 + 1
# p 2 + 2
# puts

class Integer
  alias_method :old_plus, :+

  def +(other)
    self.old_plus(other).old_plus(1)
  end
end

p 1 + 1
p 2 + 2
puts



