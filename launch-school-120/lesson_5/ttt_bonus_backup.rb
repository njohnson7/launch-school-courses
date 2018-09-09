# ttt_bonus.rb
# frozen_string_literal: true

module Interface
  private

  def prompt(msg)
    puts ">> #{msg}"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def display_underscore_line
    puts '_' * 80
  end

  def display_empty_line(num = 1)
    puts "\n" * num
  end
end

#----------------------------------------------------------------------------

class Board
  EMPTY_MARKER = ' '

  attr_reader :string
  attr_accessor :squares, :winning_marker

  def initialize
    clear
    @string = build_string
  end

  def clear
    self.squares = ('1'..'9').map { |n| [n, EMPTY_MARKER] }.to_h
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

  def empty_square_nums
    squares.select { |_, marker| marker == EMPTY_MARKER }.keys
  end

  def []=(square_num, marker)
    squares[square_num] = marker
  end

  def full?
    empty_square_nums.empty?
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
      lines.find { |line| line.first != EMPTY_MARKER && line.uniq.size == 1 }
    winning_line && self.winning_marker = winning_line.first
  end
end

#---------------------------------------------------------------------------

class Player
  include Interface

  attr_accessor :name, :score

  def initialize
    set_name
    reset_score
  end

  def reset_score
    self.score = 0
  end
end

#---------------------------------------------------------------------------

class Computer < Player
  MARKER = 'O'

  def set_name
    self.name = %w[R2D2 C3PO 4-LOM HK-47].sample
  end

  def mark(board)
    square_num = board.empty_square_nums.sample
    board[square_num] = MARKER
  end
end

#---------------------------------------------------------------------------

class Human < Player
  MARKER = 'X'

  def set_name
    loop do
      prompt 'Please enter your name:'
      n = gets.chomp
      break self.name = n unless n.empty?
      prompt 'Name cannot be empty.'
    end
  end

  def name
    @name.gsub(/\b\w/, &:upcase)
  end

  def mark(board)
    empty_square_nums = board.empty_square_nums
    loop do
      puts 'Enter one of the following numbers to mark a square:' \
           " #{empty_square_nums.join(', ')}"
      square_num = gets.chomp
      if empty_square_nums.include?(square_num)
        board[square_num] = MARKER
        break
      end
      puts "Sorry, #{square_num} is not a valid choice."
    end
  end

  def winner?(board)
    board.winning_marker == MARKER
  end
end

#---------------------------------------------------------------------------

class Game
  include Interface

  PROGRAM_NAME = 'Tic-Tac-Toe'
  POINTS_TO_WIN = 2

  attr_reader :board, :human, :computer, :players, :current_player

  def initialize
    display_welcome_msg
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @players = [computer, human].cycle
    @current_player = nil
  end

  def display_welcome_msg
    clear_screen
    display_underscore_line
    puts "Welcome to #{PROGRAM_NAME}!".center(80)
    display_underscore_line
    display_empty_line(3)
  end

  def display_goodbye_msg
    clear_screen
    display_underscore_line
    puts "Thank you for playing #{PROGRAM_NAME}! Goodbye!".center(80)
    display_underscore_line
  end

  def display_round_start(round_num)
    msg = "ROUND #{round_num}!"
    clear_screen
    prompt msg
    puts '=' * (msg.size + 3)
    display_empty_line(2)
  end

  def play_again?
    msg = ">> Enter any key to play again or 'q' to quit: "
    display_empty_line(2)
    puts '-' * (msg.size - 1)
    print msg
    choice = gets.chomp.downcase
    choice != 'q'
  end

  def round_winner
    if board.someone_won?
      human.winner?(board) ? human : computer
    end
  end

  def increment_score
    board.someone_won? && winner.score += 1
  end

  def display_round_result
    display_board
    puts winner ? "#{winner.name} has won the round!" : "It's a tie!"
  end

  def reset
    board.clear
    players.rewind
    players.each(&:reset_score)
    clear_screen
  end

  def switch_player
    @current_player = players.next
  end

  def human_turn?
    current_player == human
  end

  def display_board
    puts "#{human.name}'s marker: #{Human::MARKER}   |   " \
         "#{computer.name}'s marker: #{Computer::MARKER}"
    display_empty_line
    board.display
    display_empty_line
  end

  def display_board_and_clear_screen
    clear_screen
    display_board
  end

  def match_over?
    players.map(&:score).any? { |score| score == POINTS_TO_WIN }
  end

  def round_over?
    board.someone_won? || board.full?
  end

  def display_match_result

  end

  def play_round(round_num)
    display_round_start(round_num)
    display_board
    loop do
      switch_player

      display_board_and_clear_screen if human_turn?
      current_player.mark(board)
      break if round_over?

    end
    display_round_result
  end

  def play_match
    round_num = 1
    loop do

      play_round(round_num)


      increment_score
      break if match_over?
      round_num += 1
      reset
    end
    # display_match_result
  end

  def play
    loop do
      play_match
      break unless play_again?
    end

    display_goodbye_msg
  end
end

Game.new.play




class Round
  include Interface

  attr_reader :human, :computer, :players, :current_player, :round_num

  def initialize(human, computer, round_num)
    @board = Board.new
    @human = human
    @computer = computer
    @players = [human, computer].cycle
    @current_player = nil
    @round_num = round_num
  end

  def human_turn?
    current_player == human
  end

  def switch_player
    @current_player = players.next
  end

  def display_start

  end



  def play
    display_start
    display_board
    loop do
      switch_player
      display_board_and_clear_screen if human_turn?
      current_player.mark(board)
      break if board.someone_won? || board.full?
    end
    find_winner
    increment_score
    display_result
    display_score
  end
end