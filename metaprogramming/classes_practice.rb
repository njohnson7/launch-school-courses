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



class C
  def m1
    def m2; end
  end
end

class D < C; end

obj = D.new
p C.instance_methods(false)  # => [:m1]
obj.m1
p C.instance_methods(false)  # => [:m1, :m2]
puts



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



