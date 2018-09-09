# passing_block.rb
# Passes a block into a method



# method that takes a block as an argument
def take_block(&block)        # ampersand (&) in the method definition tells us that the argument is a block
                              # the block must always be the last parameter in the method definition
  block.call
end

take_block do       # call method, and since this method can accept a block, we can pass in a block of code using do/end
  puts "Block being called in the method!"
end

take_block { puts "this is also a block" }



# method that takes BOTH a block and another argument
def take_block2(number, &block)
  block.call(number)
end

number = 42
take_block2(number) do |num|        # passes number into take_block2 method, and uses it in block.call
  puts "Block being called in the method! Plus a number as an argument: #{num}"
end



# method that takes block and TWO numbers
def take_block3(number1, number2, &block)
  block.call(number1, number2)
end

number2 = 45
take_block3(number, number2) { |num1, num2| puts "Block - number 1: #{num1}, number 2: #{num2}" }