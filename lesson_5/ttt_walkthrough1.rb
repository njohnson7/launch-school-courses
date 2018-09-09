# ttt_walkthrough1.rb

# Nouns: board, player, square, grid
# Verbs: play, mark

# Orgnaized:
# Board
# Square
# Player
  # mark
  # play

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :squares

  def initialize
    reset
  end

  def []=(key, marker)
    squares[key].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      sqs = squares.values_at(*line)
      return sqs.first.marker if three_identical_markers?(sqs)
    end
    nil
  end

  def reset
    @squares = (1..9).map { |key| [key, Square.new] }.to_h
  end

  def draw
    puts '     |     |'
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts '     |     |'
  end

  private

  def three_identical_markers?(sqs)
    marked_sqs = sqs.select(&:marked?).map(&:marker)
    marked_sqs.size == 3 && marked_sqs.uniq.size == 1
  end
end

#---------------------------------------------------------------------------

class Square
  INITIAL_MARKER = ' '.freeze

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

#---------------------------------------------------------------------------

# class Player
#   attr_reader :marker

#   def initialize(marker)
#     @marker = marker
#   end
# end

Player = Struct.new(:marker)

#---------------------------------------------------------------------------

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER.freeze

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_msg

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end

      display_result
      break unless play_again?
      reset
      display_play_again_msg
    end

    display_goodbye_msg
  end

  private

  def clear
    system('clear') || system('cls')
  end

  def display_welcome_msg
    clear
    puts 'Welcome to Tic Tac Toe!'
    puts
  end

  def display_goodbye_msg
    clear
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    puts
    board.draw
    puts
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')})"
    loop do
      square = gets.chomp.to_i
      if board.unmarked_keys.include?(square)
        board[square] = human.marker
        break
      end
      puts "Sorry, that's not a valid choice."
    end
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    puts case board.winning_marker
         when human.marker    then 'You won!'
         when computer.marker then 'Computer won!'
         else                      "It's a tie!"
         end
  end

  def play_again?
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      return answer == 'y' if %w[y n].include?(answer)
      puts 'Sorry, must be y or n'
    end
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_msg
    puts "Let's play again!"
    puts
  end
end

TTTGame.new.play
