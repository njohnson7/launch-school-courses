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
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]


  attr_reader :squares

  def initialize
    @squares = (1..9).map { |key| [key, Square.new] }.to_h
  end

  def get_square_at(key)
    squares[key]
  end

  def set_square_at(key, marker)
    squares[key].marker = marker
  end

  def unmarked_keys
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
      ;require'pry';binding.pry;
    !!detect_winner
  end

  # return winning marker or nil
  def detect_winner
    WINNING_LINES.each do |line|
      if squares.values_at(*line).all? do |marker|
          marker == TTTGame::HUMAN_MARKER || marker == TTTGame::COMPUTER_MARKER
        end
          ;require'pry';binding.pry;
        return squares[line[0]]
      end
    end
    nil
  end
end

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
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_msg
    puts 'Welcome to Tic Tac Toe!'
    puts
  end

  def display_goodbye_msg
    puts
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board(board)
    system 'clear'
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    puts
    puts '     |     |'
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts '     |     |'
    puts
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')})"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    display_board(board)
    puts "The board is full!"
  end

  def play
    display_welcome_msg
    display_board(board)

    loop do
      human_moves
      break if board.someone_won? || board.full?
      # break if someone_won? || board_full?

      computer_moves
      break if board.someone_won? || board.full?
      # break if someone_won? || board_full?
      display_board(board)
    end
    display_result
    display_goodbye_msg
  end
end

TTTGame.new.play
