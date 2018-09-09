# Write a program that will take a decimal number, and convert it to the
# appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and
# those who don't. You and your fellow cohort of those in the "know" when it
# comes to binary decide to come up with a secret "handshake".

# The program should consider strings specifying an invalid binary as the value 0.

# input: decimal integer, or binary num as String
  # convert invalid inputs to 0
# output: sequence of events for secret handshake according to rules:
  # 1 = wink                1
  # 10 = double blink       2
  # 100 = close your eyes   4
  # 1000 = jump             8
  # 10000 = Reverse the order of the operations in the secret handshake    16

# class SecretHandshake
#   COMMANDS = { 1 => 'wink', 2 => 'double blink', 4 => 'close your eyes',
#                8 => 'jump', 16 => :reverse }.freeze

#   def initialize(num)
#     # @num = num.is_a?(String) ? num.to_i(2) : num
#     @num = num.is_a?(String) ? to_decimal(num) : num
#   end

#   def commands
#     sequence = COMMANDS.select { |k, _| k & @num == k }.values
#     sequence.last == :reverse ? sequence[0..-2].reverse : sequence
#   end

#   def to_decimal(str)
#     str[/[^01]/] ? 0 : str.each_char.reduce(0) { |sum, n| n.to_i + sum * 10 }
#   end
# end



# class SecretHandshake
#   COMMANDS = %w[reverse jump close\ your\ eyes double\ blink wink]

#   def initialize(num)
#     num = num.is_a?(Integer) ? num.to_s(2) : (num[/[^01]/] ? '0' : num)
#     @digits = (['0'] * (5 - num.size)) + num.chars
#   end

#   def commands
#     cmds = @digits.map.with_index { |n, idx| COMMANDS[idx] if n['1'] }.compact
#     cmds.first == 'reverse' ? cmds.drop(1) : cmds.reverse
#   end
# end


class SecretHandshake
  COMMANDS = { 1  => -> (arr) { arr << 'wink' },
               2  => -> (arr) { arr << 'double blink' },
               4  => -> (arr) { arr << 'close your eyes' },
               8  => -> (arr) { arr << 'jump' },
               16 => -> (arr) { arr.reverse! } }

  def initialize(num)
    @num = num.is_a?(String) ? (num[/[^01]/] ? 0 : num.to_i(2)) : num
  end

  def commands
    # COMMANDS.reduce([]) { |arr, (k, v)| k & @num == k ? v.call(arr) : arr }
    COMMANDS.each_with_object([]) { |(k, v), arr| v.call(arr) if k & @num == k }
  end
end


handshake = SecretHandshake.new 9
p handshake.commands # => ["wink","jump"]

handshake = SecretHandshake.new "11001"
p handshake.commands # => ["jump","wink"]
p SecretHandshake.new('1').commands
