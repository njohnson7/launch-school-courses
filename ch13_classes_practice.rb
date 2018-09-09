# ch13_classes_practice.rb



# extending an old class:
class Integer
  def to_eng
    if self == 5
      english = 'five'
    else
      english = 'forty-two'
    end
    english
  end
end
puts 5.to_eng
puts 42.to_eng
puts


# creating a new class - Die class:

class Die
  def initialize
    roll
  end

  def roll
    @number_showing = 1 + rand(6)
  end

  def showing
    @number_showing
  end

  def cheat(num)
    if num >= 1 && num <= 6
      @number_showing = num
    else
      puts "ERROR: Number must be between 1 and 6."
    end
  end
end

# make a couple of dice:
dice = [Die.new, Die.new]

# and roll them:
dice.each do |die|
  puts die.roll
end
puts

# example of using @number_showing Die instance var:
die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing
puts

puts Die.new
puts Die.new.roll
puts Die.new.showing
puts

puts Die.new.cheat(3)
puts Die.new.cheat(1)
puts Die.new.cheat(8)