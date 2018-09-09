# medium1_06.rb
# Stack Machine Interpretation

# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:

#     n Place a value n in the "register"
#     PUSH Push the register value on to the stack
#     ADD Add value on stack to the register value
#     SUB Subtract value on stack from the register value
#     MULT Multiply value on stack by the register value
#     DIV Divide value on stack into the register value
#     MOD Divide value on stack into the register value and leave remainder
#     POP Remove item from stack and place in register
#     PRINT print the register value

# ADD, SUB, MULT, DIV, and MOD all remove the topmost item from the stack,
# perform the operation, and leave the result in the register.

# All operations are integer operations (which is only important with DIV and
# MOD).

# Programs will be supplied to your language method via a string passed in as an
# argument. Your program may assume that all programs are correct programs; that
# is, they won't do anything like try to pop a non-existent value from the
# stack, and they won't contain unknown tokens.

# You should initialize the register to 0.

def integer?(str)
  str =~ /\A(\+|-)?\d+\z/
end

def minilang(program)
  register = 0
  stack = []
  commands = program.split
  until commands.empty?
    command = commands.shift
    if integer?(command)
      register = command.to_i
    else
      case command
      when 'PUSH'  then stack << register
      when 'ADD'   then register += stack.pop
      when 'SUB'   then register -= stack.pop
      when 'MULT'  then register *= stack.pop
      when 'DIV'   then register /= stack.pop
      when 'MOD'   then register %= stack.pop
      when 'POP'   then register = stack.pop
      when 'PRINT' then puts register
      end
    end
  end
end

minilang('PRINT') # 0
minilang('5 PUSH 3 MULT PRINT') # 15
puts
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts
minilang('5 PUSH POP PRINT') # 5
minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
minilang('-3 PUSH 5 SUB PRINT') # 8
minilang('6 PUSH') # (nothing printed; no PRINT commands)
puts
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
puts


# Try writing a minilang program to evaluate and print the result of this
# expression:

# (3 + (4 * 5) - 7) / (5 % 3)

# The answer should be 8. This is trickier than it sounds!

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT')
puts
puts


# Add some error handling to your method. In particular, have the method detect
# empty stack conditions, and invalid tokens in the program, and report those.
# Ideally, the method should return an error message if an error occurs, and nil
# if the program runs successfully.

def minilang(program)
  register = 0
  stack = []
  program.split.each do |command|
    if integer?(command) then register = command.to_i
    else
      if stack.empty? && !(command == 'PUSH' || command == 'PRINT')
        raise StandardError, 'Cannot remove value from empty stack.'
      else
        case command
        when 'PUSH'  then stack << register
        when 'PRINT' then puts register
        when 'ADD'   then register += stack.pop
        when 'SUB'   then register -= stack.pop
        when 'MULT'  then register *= stack.pop
        when 'DIV'   then register /= stack.pop
        when 'MOD'   then register %= stack.pop
        when 'POP'   then register = stack.pop
        else raise ArgumentError, "'#{command}' is not a valid token."
        end
      end
    end
  end
  nil
end

minilang('PRINT') # 0
minilang('5 PUSH 3 MULT PRINT') # 15
puts
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts
minilang('5 PUSH POP PRINT') # 5
minilang('3 PUSH PUSH 7 DIV MULT PRINT ') # 6
minilang('4 PUSH PUSH 7 MOD MULT PRINT ') # 12
minilang('-3 PUSH 5 SUB PRINT') # 8
minilang('6 PUSH') # (nothing printed; no PRINT commands)
puts
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
puts

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 4 PUSH 5 MULT ADD SUB DIV PRINT') # 8
minilang('3 PUSH 5 STAMP PRINT') # Error
minilang('3 PUSH 5 ADD ADD') # Error
puts
