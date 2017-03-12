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
puts



def say(words)
  yield(5) if block_given?
  yield if block_given?
  puts words
end

say('hello') { |n = 1| p n + 10 }
puts


def increment(num)
  block_given? ? yield(num + 1) : num + 1
end

p increment(5) { |n| puts n }
puts


def testing
  yield(1, 2)
end

testing { |num| p num }
puts



def testing
  yield(1)
end

testing { |num1, num2| p num1, num2 }
puts


def compare(word)
  puts "Before: #{word}"
  puts "After: #{yield(word) if block_given?}"
end

p compare('hi') { |word| word.upcase }
p compare('hello') { |word| word.slice(1..2) }
puts

w = 'hello'
compare(w) { |word| word.slice!(1..2) }
p w
puts

compare('hello') { |word| 'nothing to do with anything' }
compare('hello') { |word| puts 'hi' }
puts


def compare(str, flag)
  after = case flag
          when :upcase     then str.upcase
          when :capitalize then str.capitalize
          end
  puts "Before: #{str}"
  puts "After: #{after}"
end

compare('hello', :upcase)
puts


def time_it
  time_before = Time.now
  yield if block_given?
  time_after = Time.now
  puts "It took #{time_after - time_before} seconds."
end

time_it { 'hello world' }
time_it { 5 + 4 }
time_it { (1..1000).reduce(:+) }
time_it { (1..5).to_a.permutation.to_a }
time_it { (1..6).to_a.permutation.to_a }
time_it { (1..7).to_a.permutation.to_a }
time_it { (1..8).to_a.permutation.to_a }
# time_it { (1..9).to_a.permutation.to_a }
# time_it { (1..10).to_a.permutation.to_a }
# time_it { sleep(1) }
puts




def testing(&block)
  puts "What's &block? #{block}"
end

p testing { sleep(1) } # block is not called in method, so sleep is not executed


# def testing(&block1, &block2)    # DOESN'T WORK!
#   block1.call
#   block2.call
# end

def testing(&block1)
  block1.call
  yield
end

# testing { puts 1} { puts 2 }          # DOESN't WORK!
# [1,2,3].each { |n| p n + 1 } { p 2}   # DOESN'T WORK!
puts
p 1.to_s { 123 }                        # WORKS!
p 1.to_s { |a| a + 1 }                  # WORKS!
p 1.to_s { |a| a + 1 } { puts 'wtf' }   # WORKS!
puts


def testing
  yield(1, 2)
end

testing { |n| puts n }
testing { |n1, n2| p n1, n2}

def testing
  yield(1)
end

testing { |n1, n2| p n1, n2}
puts


name = 'Bob'
chunk_of_code = Proc.new { puts "hi #{name}"}
chunk_of_code.call
name = 'Fred'
chunk_of_code.call
puts

def call_me(some_code)
  some_code.call
end

name = 'Bob'
chunk_of_code = Proc.new { puts "hi #{name}"}
p call_me(chunk_of_code)

name = 'Fred'
p call_me(chunk_of_code)
puts


def my_method
  yield(5)
end

p my_method(&:to_s)
p my_method(&:to_s.to_proc)
p my_method(&(:to_s.to_proc))
a_proc = :to_s.to_proc
p my_method(&a_proc)
puts

def my_method(proc)
  proc.call(5)
end

p my_method(:to_s.to_proc)
puts


def my_method(&block)
  block.call(5)
end

p my_method { |n| n.to_s }
puts

def my_method
  yield(5)
end

p my_method(&:to_s)
a_proc = :to_s.to_proc
p my_method(&a_proc)
puts


def hello
  puts 'hello'
end

def say_hello(block)
  block.call
end

say_hello method(:hello)