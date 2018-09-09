# medium1_07.rb

class Guesser
  def initialize(start_num, end_num)
    @range = start_num..end_num
  end

  def play
    reset
    loop do
      puts "You have #{@guesses} guesses remaining."
      num = choose_num
      return puts 'You win!' if num == @target
      display_guess_info(num)
      @guesses -= 1
      break if @guesses.zero?
    end
    puts "You are out of guesses. You lose."
  end

  def display_guess_info(num)
    puts "Your guess is too #{num < @target ? 'low' : 'high' }"
  end

  def choose_num
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      num = gets.to_i
      return num if @range.cover?(num)
      print 'Invalid guess. '
    end
  end

  def reset
    @guesses = Math.log2(@range.size).floor + 1
    @target = rand(@range)
  end
end

# game = Guesser.new(501, 1500)
# game.play
# game.play


def append(arr, n)
  return [] if n < 0
  append(arr, n - 1) + [n]
end

# p append([], 3)


3.times do |idx|
  puts hello if idx == 1
  hello = 'hello' if idx == 0
  puts hello
end
​