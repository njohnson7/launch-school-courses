# class MyClass < Array
#   def my_method
#     'Hello!'
#   end
# end


my_class = Class.new(Array) { define_method(:my_method) { 'Hello!' } }

p my_class.name     # => nil
MyClass = my_class
p my_class.name     # => 'MyClass'

obj = my_class.new
p obj.my_method
p obj << 1 << 2
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
