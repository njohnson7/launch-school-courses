# medium1_06.rb

class PingGame
  def play
    @target = rand(1..100)
    @guesses = 7
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
      print 'Enter a number between 1 and 100: '
      num = gets.to_i
      return num if num.between?(1, 100)
      print 'Invalid guess. '
    end
  end
end


PingGame.new.play
