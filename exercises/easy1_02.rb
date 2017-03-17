# easy1_02.rb

# Optional Blocks

# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not
# compute.'.

def compute
  block_given? ? yield : 'Does not compute.'
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'



# Further Exploration

# Modify the compute method so it takes a single argument and yields that
# argument to the block. Provide at least 3 examples of calling this new version
# of compute, including a no-block call.



def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end


def compute(arg, &block)
  block_given? ? block.call(arg) : 'Does not compute.'
end


p compute(10) { |n| n.abs2 } == 100
p compute(10, &:abs2) == 100
p compute('string', &:upcase) == 'STRING'
p compute([1, 2, 3], &:sum) == 6
p compute(5) { |n| puts n } == nil        # outputs 5
p compute(10) == 'Does not compute.'


# DOESNT WORK!:

# define_method(:compute) { |arg| block_given? ? yield(arg) : 'Does not compute.' }
