# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name.The first time you
# boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory settings, which
# means that their name gets wiped. The next time you ask, it will respond with
# a new random name.

# The names must be random: they should not follow a predictable sequence.
# Random names means a risk of collisions. Your solution should not allow the
# use of the same name twice when avoidable.

# name: /^[A-Z]{2}\d{3}$/  5 chars: 2 capital letters, 3 digits



# class Robot
#   LETTERS = ('A'..'Z').to_a.freeze
#   NUMS = ('0'..'9').to_a.freeze

#   @@names = []

#   attr_reader :name

#   def initialize
#     reset
#   end

#   def reset
#     loop do
#       @name = ''
#       2.times { name << LETTERS.sample }
#       3.times { name << NUMS.sample }
#       break unless @@names.include?(name)
#     end
#       @@names << name
#   end
# end



class Robot
  attr_reader :name

  def reset
    @@names ||= []
    @name = [*'AA'..'ZZ'].sample << [*'000'..'999'].sample
    @@names.include?(name) ? reset : @@names << name
  end

  alias initialize reset
end
