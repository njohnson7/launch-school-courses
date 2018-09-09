# medium1_06.rb

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc        # a Proc object
puts my_proc.class  # Proc class
my_proc.call        # thing evals to nil
my_proc.call('cat') # thing evals to 'cat'
# lenient arity rules, like blocks

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }    # same as group 1
my_second_lambda = -> (thing) { puts "This is a #{thing}" } # same as above
puts my_lambda        # Proc obj lamda
puts my_second_lambda # ''
puts my_lambda.class  # Proc
my_lambda.call('dog') # thing evals to 'dog'
my_lambda.call        # ArgumentError
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } # NameError
# strict arity rules, like methods

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."} # seal evals to nil
block_method_1('seal') # LocalJumpError
# methods have strict arity rules
# blocks have lenient arity rules

# Group 4
def block_method_2(animal)
  yield(animal)
end

# turtle evals to 'turtle'
block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# seal evals to nil b/c only 1 animal is passed into the block
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."} # NameError


# procs and blocks both have lenient arity rules, so they ignore extra args
# passed in, and convert block local vars to nil if no corresponding arg is
# passed in.

# Methods and lambdas both have strict arity rules, and throw an ArgumentError
# if insufficient or extra args are passed in.

# blocks, procs, and lambdas are all Proc objects, while methods are not.
