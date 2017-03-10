# 130_practice.rb

def hello
  'hello!'
end

p hello
p hello { p 123 }
p hello { |n| p n }
p hello { |n| p n } { 123 }
puts

def echo_with_yield(str)
  yield
  str
end

# p echo_with_yield('hello')
p echo_with_yield('hello') { |a| puts a }
p echo_with_yield('hello') { |a| puts 123 }
p echo_with_yield('hello') { puts 123 }
p echo_with_yield('hello') { puts 'world' }
puts


def echo2(str)
  print "#{str} "
  yield
end

echo2('hello') { puts 'world' }
puts


def echo_with_yield(str)
  yield if block_given?
  str
end

p echo_with_yield('hello')
p echo_with_yield('hello') { puts 'world'}
puts



def say(words)
  yield if block_given?
  puts "> #{words}"
end

say('hi there') { system 'clear' }


class Dog
  def initialize(name)
    @name = name
    yield if block_given?
  end
end

sparky = Dog.new('Sparky') { puts 'a new dog has been created'}