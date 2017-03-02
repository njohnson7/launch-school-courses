# ttt_practice.rb

# Description:
# TTT is a 2 player board game played on a 3x3 grid.
# Players take turns putting their marker on a square on the board.
  # markers: X or O
# The first player who marks 3 consecutive squares, in a row, column, or diagonal
#  line, wins.
# If no one has 3 consec markers, it's a tie.

# Nouns: board (squares), players (computer, human), markers (X, O),
# Verbs: take turn, mark

class Board
  EMPTY = ' '.freeze

  attr_reader :string
  attr_accessor :squares, :winning_marker

  def initialize
    @squares = ('1'..'9').map { |n| [n, EMPTY] }.to_h
    @string = build_string
  end

  def build_string
    <<~STRING
         |   |
       1 | 2 | 3
      ___|___|___
         |   |
       4 | 5 | 6
      ___|___|___
         |   |
       7 | 8 | 9
         |   |
    STRING
  end

  def display
    puts string.gsub(/\d/, squares)
  end

  def empty_squares
    squares.select { |_, marker| marker == EMPTY }.keys
  end

  def mark(square, marker)
    squares[square] = marker
  end

  def full?
    empty_squares.empty?
  end

  def someone_won?
    set_winning_marker
  end

  def lines
    rows = squares.values.each_slice(3).to_a
    columns = rows.transpose
    diagonals =
      [squares.values_at('1', '5', '9'), squares.values_at('3', '5', '7')]
    [*rows, *columns, *diagonals]
  end

  def set_winning_marker
    winning_line =
      lines.find { |line| line.first != EMPTY && line.uniq.size == 1 }
    winning_line && self.winning_marker = winning_line.first
  end
end

#---------------------------------------------------------------------------

class Player
  attr_accessor :name

  def initialize
    set_name
  end

  def take_turn(board)
    puts "#{name}'s turn."
    mark_square(board)
    board.display
  end
end

#---------------------------------------------------------------------------

class Computer < Player
  MARKER = 'O'.freeze

  def set_name
    self.name = 'Compy'
  end

  def mark_square(board)
    square = board.empty_squares.sample
    board.mark(square, MARKER)
  end
end

#---------------------------------------------------------------------------

class Human < Player
  MARKER = 'X'.freeze

  def set_name
    self.name = 'Bob'
  end

  def mark_square(board)
    empty_squares = board.empty_squares
    loop do
      puts "Enter one of the following numbers to mark a square:" \
           " #{empty_squares.join(', ')}"
      square = gets.chomp
      if empty_squares.include?(square)
        board.mark(square, MARKER)
        break
      end
      puts "Sorry, #{square} is not a valid choice."
    end
  end

  def winner?(board)
    board.winning_marker == MARKER
  end
end

#---------------------------------------------------------------------------

class Game
  attr_reader :board, :human, :computer, :current_player

  def initialize
    # display_welcome_msg

    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_player = [computer, human].cycle
  end

  def play
    loop do
      current_player.next.take_turn(board)
      break if board.someone_won? || board.full?
    end

    if board.someone_won?
      winner = human.winner?(board) ? human : computer
      puts "#{winner.name} has won the game!"
    else
      puts "It's a tie!"
    end

    # display_goodbye_msg
  end
end

Game.new.play
