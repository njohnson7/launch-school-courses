# ttt_bonus.rb
# frozen_string_literal: true

module Interface
  private

  def clear_screen
    system('clear') || system('cls')
  end

  def display_empty_line(num = 1)
    puts "\n" * num
  end

  def display_underscore_line(size = 80)
    puts '_' * size
  end

  def prompt(msg)
    puts ">> #{msg}"
  end
end

#____________________________________________________________________________
#____________________________________________________________________________
#____________________________________________________________________________

class Board
  EMPTY_MARKER = ' '

  attr_reader :string, :squares
  attr_accessor :winning_marker

  def initialize
    # reset
    @squares = ('1'..'9').zip([EMPTY_MARKER] * 9).to_h
    @string = build_string
  end

  def []=(square_num, marker)
    squares[square_num] = marker
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

  def full?
    empty_square_nums.empty?
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

  def someone_won?
    set_winning_marker
  end

  def to_a

  end
end

#____________________________________________________________________________
#____________________________________________________________________________
#____________________________________________________________________________

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

#____________________________________________________________________________
#____________________________________________________________________________
#____________________________________________________________________________

class Computer < Player
  MARKER = 'O'

  def set_name
    self.name = %w[R2D2 C3PO 4-LOM HK-47].sample
  end

  def mark(board)
    square_num = minimax(board.dup, MARKER)[:square_num]
    board[square_num] = MARKER
  end

  def minimax(new_board, marker)
    if new_board.someone_won?
      return new_board.winning_marker == MARKER ? { score: 10 } : { score: -10 }
    elsif new_board.full?
      return { score: 0 }
    end

    moves = []
    new_board.empty_square_nums.each do |square_num|
      move = {}
      move[:square_num] = square_num
      new_board[square_num] = marker

      if marker == MARKER
        result = minimax(new_board, Human::MARKER)
        move[:score] = result[:score]
      else
        result = minimax(new_board, MARKER)
        move[:score] = result[:score]
      end

      new_board[square_num] = Board::EMPTY_MARKER

      moves << move
    end

    computer_turn = marker == MARKER
    best_move = find_best_move(moves, marker, computer_turn)


    moves[best_move]
  end

  def find_best_move(moves, marker, computer_turn)
    best_score = computer_turn ? -10_000 : 10_000
    if marker == MARKER
      best_score = -10_000
      moves.each_with_index do |move, idx|
        if move[:score] > best_score
          best_score = move[:score]
          best_move = idx
        end
      end
    else
      best_score = 10_000
      moves.each_with_index do |move, idx|
        if move[:score] < best_score
          best_score = move[:score]
          best_move = idx
        end
      end
    end
  end
end

#____________________________________________________________________________
#____________________________________________________________________________
#____________________________________________________________________________

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

  def mark(board)
    empty_square_nums = board.empty_square_nums
    loop do
      prompt 'Enter one of the following numbers to mark a square:' \
           " #{empty_square_nums.join(', ')}"
      square_num = gets.chomp
      if empty_square_nums.include?(square_num)
        board[square_num] = MARKER
        break
      end
      prompt "Sorry, #{square_num} is not a valid choice."
    end
  end

  def name
    @name.gsub(/\b\w/, &:upcase)
  end

  def winner?(board)
    board.winning_marker == MARKER
  end
end

#____________________________________________________________________________
#____________________________________________________________________________
#____________________________________________________________________________

class Round
  include Interface

  attr_reader :board, :human, :computer, :players, :current_player, :round_num

  def initialize(human, computer, round_num)
    @board = Board.new
    @human = human
    @computer = computer
    @players = [human, computer].cycle
    @current_player = nil
    @round_num = round_num
  end

  def display_board
    marker_str = "#{human.name}'s marker:  #{Human::MARKER}      " \
                 "#{computer.name}'s marker:  #{Computer::MARKER}"
    display_round_num
    display_underscore_line(marker_str.size)
    puts marker_str
    display_empty_line
    board.display
    display_empty_line
  end

  def display_board_and_clear_screen
    clear_screen
    display_board
  end

  def display_round_num
    prompt "ROUND #{round_num}"
  end

  def display_result
    display_board_and_clear_screen
    prompt(winner ? "#{winner.name} has won the round!" : "It's a tie!")
  end

  def finished?
    board.someone_won? || board.full?
  end

  def human_turn?
    current_player == human
  end

  def increment_score
    winner && winner.score += 1
  end

  def switch_player
    @current_player = players.next
  end

  def winner
    if board.someone_won?
      human.winner?(board) ? human : computer
    end
  end

  def play
    display_board
    loop do
      switch_player
      display_board_and_clear_screen if human_turn?
      current_player.mark(board)
      break if finished?
    end
    increment_score
    display_result
  end
end

#____________________________________________________________________________
#____________________________________________________________________________
#____________________________________________________________________________

class Game
  include Interface

  PROGRAM_NAME = 'Tic-Tac-Toe'
  POINTS_TO_WIN = 2

  attr_reader :human, :computer, :current_player

  def initialize
    display_welcome_msg
    @human = Human.new
    @computer = Computer.new
  end

  def display_round_break
    print ' >> Press enter to begin next round...'
    gets
  end

  def display_goodbye_msg
    clear_screen
    display_underscore_line
    puts "Thank you for playing #{PROGRAM_NAME}! Goodbye!".center(80)
    display_underscore_line
  end

  def display_result
    prompt "#{winner.name} has won the match with #{winner.score} points!"
  end

  def display_score
    ljust_amount = [human.name.size, computer.name.size].max + 14
    [human, computer].each do |player|
      score_str = "#{player.score} of #{POINTS_TO_WIN}"
      puts " - #{player.name}'s score:".ljust(ljust_amount) + score_str
    end
    display_empty_line
  end

  def display_welcome_msg
    clear_screen
    display_underscore_line
    puts "Welcome to #{PROGRAM_NAME}!".center(80)
    display_underscore_line
    display_empty_line(3)
  end

  def play_again?
    msg = ">> Enter any key to play again or 'q' to quit: "
    display_empty_line(2)
    puts '-' * (msg.size - 1)
    print msg
    choice = gets.chomp.downcase
    choice != 'q'
  end

  def winner
    [human, computer].find { |player| player.score == POINTS_TO_WIN }
  end

  def play_match
    round_num = 1
    loop do
      Round.new(human, computer, round_num).play
      display_score
      break if winner
      round_num += 1
      display_round_break
    end
    display_result
  end

  def play
    loop do
      play_match
      break unless play_again?
      [human, computer].each(&:reset_score)
    end
    display_goodbye_msg
  end
end

Game.new.play
