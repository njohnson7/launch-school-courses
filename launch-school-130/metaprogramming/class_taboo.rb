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



