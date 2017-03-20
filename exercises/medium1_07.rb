# # medium1_07.rb

# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

p check_return_with_proc

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

# p check_return_with_proc_2(my_proc)

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

p check_return_with_lambda

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

p check_return_with_lambda(my_lambda)

# Group 5
def block_method_3
  yield
end

# p block_method_3 { return }


# Group 3
def check_return_with_lambda2
  my_lambda = lambda do
    p 1
    eval('return')
    p 2
  end
  my_lambda.call
  puts "This will be output to screen."
end

p check_return_with_lambda2



# Group 3

def check_return_with_lambda
  a = 'a'
  my_lambda = lambda { return a }
  var = my_lambda.call
  puts var
end

p check_return_with_lambda

b = 'b'
my_lambda = lambda { return b }
def check_return_with_lambda(my_lambda)
  var = my_lambda.call
  puts var
end

p check_return_with_lambda(my_lambda)

puts

def check_return_with_proc
  my_proc = proc { return 'a' }
  my_proc.call
  puts 123
end

p check_return_with_proc
puts
puts




# Group 6:
def my_method1
  my_proc = proc { return 'proc return' ; p 'after proc return' }
  puts '1: A'
  my_method2(my_proc)
  puts '1: B'           # does not get executed
  'my method 1 return'
end

def my_method2(my_proc)
  puts '2: C'
  my_proc.call # execution jumps to proc definition, then returns to main
  puts '2: D'  # does not get executed
end

p my_method1  # displays: '1: A', '2: C', 'proc return'
puts

# Group 7:
def my_method1
  my_lambda = lambda { return 'lambda return' ; p 'after lambda return' }
  puts '1: A'
  my_method2(my_lambda)
  puts '1: B'
  'my method 1 return'
end

def my_method2(my_lambda)
  puts '2: C'
  my_lambda.call # execution jumps to lambda definition, then returns to #call
  puts '2: D'    # execution continues to next line
end

p my_method1  # displays: '1: A', '2: C', '2: D', '1: B', 'my method 1 return'

# Group 8:
return # does not raise LocalJumpError, even though we are returning from main
         # does this return to terminal?
p 1    # does not get executed

def my_method3(my_proc)
  my_proc.call
end

my_proc = proc { return }
# so why does this raise LocalJumpError if the last return example did not?
my_method3(my_proc)
