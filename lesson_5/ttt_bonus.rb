# frozen_string_literal: true

# ttt_bonus.rb

class Array
  def joinor(separator = ', ', word = 'or')
    arr = size > 1 ? [*self[0...-1], "#{word} #{last}"] : self
    arr.size == 2 ? arr.join(' ') : arr.join(separator)
  end
end

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

  def pause(seconds)
    sleep(seconds)
  end

  def prompt(msg)
    puts ">> #{msg}"
  end
end

class Board
  EMPTY_MARKER = ' '

  attr_reader :winning_marker

  def initialize
    @squares = ('1'..'9').zip([EMPTY_MARKER] * 9).to_h
  end

  def []=(square_num, marker)
    squares[square_num] = marker
  end

  def display
    puts string_representation.gsub(/\d/, squares)
  end

  def display_empty_square_nums
    puts string_representation.tr(marked_square_nums.join, ' ')
  end

  def empty?
    empty_square_nums.size == 9
  end

  def empty_square_nums
    squares.select { |_, marker| marker == EMPTY_MARKER }.keys
  end

  def end_state?
    full? || someone_won?
  end

  def someone_won?
    set_winning_marker
  end

  private

  attr_reader :squares

  def columns
    rows.transpose
  end

  def diagonals
    [squares.values_at('1', '5', '9'), squares.values_at('3', '5', '7')]
  end

  def find_winning_line
    lines.find { |line| line.first != EMPTY_MARKER && line.uniq.size == 1 }
  end

  def full?
    empty_square_nums.empty?
  end

  def lines
    [*rows, *columns, *diagonals]
  end

  def marked_square_nums
    squares.keys - empty_square_nums
  end

  def rows
    squares.values.each_slice(3).to_a
  end

  def set_winning_marker
    winning_line = find_winning_line
    winning_line && @winning_marker = winning_line.first
  end

  def string_representation
    <<~BOARD
         |   |
       1 | 2 | 3
      ___|___|___
         |   |
       4 | 5 | 6
      ___|___|___
         |   |
       7 | 8 | 9
         |   |
    BOARD
  end
end

class Player
  include Interface

  attr_reader :name, :score

  def initialize
    set_name
    reset_score
    self.class.const_set(:MARKER, set_marker)
  end

  def increment_score
    @score += 1
  end

  def reset_score
    @score = 0
  end
end

class Computer < Player
  NAMES = %w[R2D2 C3PO 4-LOM HK-47].freeze
  CORNER_SQUARE_NUMS = %w[1 3 7 9].freeze

  def human?
    false
  end

  def mark(board)
    square_num = if board.empty? then choose_corner
                 else                 minimax(board, MARKER)[:square_num]
                 end
    board[square_num] = MARKER
  end

  private

  def choose_corner
    CORNER_SQUARE_NUMS.sample
  end

  def computer_turn?(marker)
    marker == MARKER
  end

  def find_best_move(moves, marker)
    min, max = moves.minmax_by { |move| move[:score] }
    computer_turn?(marker) ? max : min
  end

  def minimax(board, marker, depth = 0)
    return move_score(board, depth) if board.end_state?

    moves = board.empty_square_nums.map do |square_num|
      move = { square_num: square_num }
      board[square_num] = marker
      opponent_marker = computer_turn?(marker) ? Human::MARKER : MARKER

      move[:score] = minimax(board, opponent_marker, depth + 1)[:score]
      board[square_num] = Board::EMPTY_MARKER

      move
    end

    find_best_move(moves, marker)
  end

  def move_score(board, depth)
    case board.winning_marker
    when MARKER        then { score: 10 - depth }
    when Human::MARKER then { score: depth - 10 }
    else                    { score: 0 }
    end
  end

  def set_marker
    Human::MARKER == 'X' ? 'O' : 'X'
  end

  def set_name
    @name = NAMES.sample
  end
end

class Human < Player
  def human?
    true
  end

  def mark(board)
    display_mark_msg(board)
    loop do
      square_num = gets.chomp
      if board.empty_square_nums.include?(square_num)
        board[square_num] = MARKER
        break
      end
      display_invalid_choice(board, square_num)
    end
  end

  def name
    @name.gsub(/\b\w/, &:upcase)
  end

  def winner?(board)
    board.winning_marker == MARKER
  end

  private

  def display_invalid_choice(board, square_num)
    prompt "Sorry, '#{square_num}' is not a valid choice. Please choose:" \
           " #{board.empty_square_nums.joinor}"
  end

  def display_mark_msg(board)
    prompt 'Enter one of the numbers below to mark that square:'
    display_empty_line
    board.display_empty_square_nums
    display_empty_line
    print '=> '
  end

  def set_marker
    display_empty_line
    loop do
      prompt 'Please choose a marker (enter any single character):'
      marker = gets.chomp
      return marker[/\S/] unless marker.delete(' ').empty?
      prompt 'Sorry, marker cannot be empty.'
    end
  end

  def set_name
    loop do
      prompt 'Please enter your name:'
      n = gets.chomp
      break @name = n unless n.delete(' ').empty?
      prompt 'Sorry, name cannot be empty.'
    end
  end
end

class Round
  include Interface

  FIRST_PICK = :choose # valid options: :human, :computer, :choose

  def self.display_break
    print '>> Press enter to begin next round...'
    gets
  end

  def self.increment_num
    @round_num += 1
  end

  def self.reset_num
    @round_num = 1
  end

  def self.num
    @round_num
  end

  def initialize(human, computer)
    @board = Board.new
    @human = human
    @computer = computer
    @players =
      first_player.human? ? [human, computer].cycle : [computer, human].cycle
  end

  def play
    loop do
      switch_current_player
      display_board if human_turn?
      current_player.mark(board)
      break if board.end_state?
    end
    increment_winners_score
    display_result
  end

  private

  attr_reader :board, :human, :computer, :players, :current_player

  def choose_first_player
    display_empty_line
    prompt "Enter any key to go first, or 'c' to let #{computer.name} go first:"
    choice = gets.chomp.downcase
    choice == 'c' ? computer : human
  end

  def display_board
    clear_screen
    display_round_num
    display_marker_info
    display_empty_line
    board.display
    display_empty_line
  end

  def display_marker_info
    marker_str = "#{human.name}'s marker:  #{Human::MARKER}      " \
                 "#{computer.name}'s marker:  #{Computer::MARKER}"
    display_underscore_line(marker_str.size)
    puts marker_str
  end

  def display_result
    display_board
    prompt(winner ? "#{winner.name} has won the round!" : "It's a tie!")
  end

  def display_round_num
    prompt "ROUND #{self.class.num}"
  end

  def first_player
    case FIRST_PICK
    when :choose then choose_first_player
    when :human  then human
    else              computer
    end
  end

  def human_turn?
    current_player == human
  end

  def increment_winners_score
    winner && winner.increment_score
  end

  def switch_current_player
    @current_player = players.next
  end

  def winner
    return unless board.someone_won?
    human.winner?(board) ? human : computer
  end
end

class Game
  include Interface

  PROGRAM_NAME = 'Tic-Tac-Toe'
  POINTS_TO_WIN = 2

  def initialize
    display_welcome_msg
    @human = Human.new
    @computer = Computer.new
  end

  def play
    loop do
      play_match
      break unless play_again?
      reset_scores
      display_continue_msg
    end
    display_goodbye_msg
  end

  private

  attr_reader :human, :computer, :current_player

  def display_continue_msg
    clear_screen
    prompt "Let's play again!"
    pause(1)
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
    [human, computer].each do |player|
      score_str = "#{player.score} of #{POINTS_TO_WIN}"
      puts " - #{player.name}'s score:".ljust(name_ljust_amount) + score_str
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

  def name_ljust_amount
    [human.name.size, computer.name.size].max + 14
  end

  def play_again?
    msg = ">> Enter any key to play again or 'q' to quit: "
    display_empty_line(2)
    puts '-' * (msg.size - 1)
    print msg
    choice = gets.chomp.downcase
    choice != 'q'
  end

  def play_match
    Round.reset_num
    loop do
      Round.new(human, computer).play
      display_score
      break if winner
      Round.increment_num
      Round.display_break
    end
    display_result
  end

  def reset_scores
    [human, computer].each(&:reset_score)
  end

  def winner
    [human, computer].find { |player| player.score == POINTS_TO_WIN }
  end
end

Game.new.play
