# Write a program that takes a word problem and returns the answer as an
# integer.

# E.g.

#     What is 5 plus 13?

# The program should return 18.

#     What is 7 minus 5 minus 1?

# The program should return 1.

# Remember, that these are verbal word problems, not treated as you normally
# would treat a written problem. This means that you calculate as you move
# forward each step. This means 3 + 2 * 3 = 15, not 9.

# Hint: to solve this problem elegantly, you need to know how the send method
# works in Ruby. If you haven't seen it before, check it out here.


# input: String containing a math word problem
  # valid input:
  #  'What is (+-)NUM plus/minus/multiplied by/divided by (+-)NUM...'
# output: Integer - result of word problem
# rules:
  # raise ArgumentError if input is invalid
# algorithm:
  # parse String for valid input
  #


class WordProblem
  OPS = { 'plus' => :+, 'minus' => :-, 'multiplied by' => :*, 'divided by' => :/ }
  OP_REGEX = /#{OPS.keys.join('|')}/
  NUM = /-?\d+/
  VALID = /\AWhat is ((#{NUM})( (#{OP_REGEX}) (#{NUM}))+)\?\z/

  def initialize(question)
    raise ArgumentError unless question.match(VALID)
    @problem = $1.scan(/#{NUM}|#{OP_REGEX}/).map { |x| x[NUM] ? x.to_i : OPS[x] }
  end

  def answer
    @problem.unshift(@problem.shift.send(*@problem.shift(2))) until @problem.size == 1
    @problem.first
  end
end
