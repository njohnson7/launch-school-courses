# ttt_test.rb

# require 'byebug'
class Board
  attr_accessor :squares
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    squares[num].marker = marker
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

  def winning_marker
    WINNING_LINES.each do |line|
      square = squares.values_at(*line)
      if three_identical_markers?(square)
        return square.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def get_player_positions(marker)
    (1..9).select { |i| squares[i].marker == marker }
  end

  def get_risky_square(marker, winning_line)
    valid_keys = get_player_positions(marker)
    risky_line = []
    valid_key_combinations = valid_keys.combination(2).to_a
    winning_line_combinations = winning_line.combination(2).to_a

    if valid_keys.size >= 2
      valid_key_combinations.each do |valid_key|
        risky_line =
          winning_line_combinations.select do |winning_line_combination|
            winning_line_combination.eql? valid_key
          end
        risky_line = risky_line.flatten
        break if risky_line.size == 2
      end
    end
    risky_line
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " ".freeze

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :marker, :name

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def give_player_names(player_type)
    puts "Enter a name for #{player_type} player:"
    @name = gets.chomp
  end
end

class TTTGame
  HUMAN_MARKER = "X".freeze
  COMPUTER_MARKER = "O".freeze
  FIRST_TO_MOVE = 'choose'.freeze
  WINNING_SCORE = 2

  attr_accessor :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    clear
    display_welcome_message

    loop do
      human.score = 0
      computer.score = 0
      choose_player_names
      choose_human_marker
      play_game
      break unless play_again?
      display_play_again_message
      reset
    end
    display_goodbye_message
  end

  private

  def clear
    system "clear"
    system "cls"
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def choose_player_names
    human.give_player_names("human")
    computer.give_player_names("computer")
  end

  def choose_human_marker
    loop do
      puts "Choose a marker(Please enter only a single letter marker)"
      marker = gets.chomp
      if marker.size == 1
        human.marker = marker
        break
      end
    end
  end

  def play_game
    loop do
      choose_who_starts
      display_board
      play_round
      clear_screen_and_display_board
      display_round_result
      display_score
      if someone_won_the_game?
        display_who_won_the_game
        break
      end
      reset
    end
  end

  def choose_who_starts
    current_player = nil
    if FIRST_TO_MOVE == 'choose'
      loop do
        puts "Choose who should start?(Enter 'p' => player & 'c' => computer"
        current_player = gets.chomp
        break if current_player == 'p' || current_player == 'c'
        puts "It's not a valid choice."
      end
      current_player == 'p' ? @current_marker = human.marker : COMPUTER_MARKER
    elsif FIRST_TO_MOVE == 'human'
      @current_marker = human.marker
    else
      @current_marker = COMPUTER_MARKER
    end
  end

  def display_board
    puts " #{human.name} is a #{human.marker}."
    puts " #{computer.name} is a #{computer.marker}. \n"
    board.draw
    puts ""
  end

  def play_round
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_round_result
    winning_marker = board.winning_marker
    case winning_marker
    when human.marker
      puts "#{human.name} won this round."
    when computer.marker
      puts "#{computer.name} won this round."
    end
    update_score(winning_marker) && return if winning_marker
    puts "It's a tie!"
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def joinor(arr, delimiter=', ', word='or')
    arr[-1] = "#{word} #{arr.last}" if arr.size > 1
    arr.size == 2 ? arr.join(' ') : arr.join(delimiter)
  end

  def human_moves
    puts "Choose a square #{joinor(board.unmarked_keys)}: "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def someone_won_the_game?
    if human.score == WINNING_SCORE || computer.score == WINNING_SCORE
      true
    else
      false
    end
  end

  def who_won?
    if human.score == WINNING_SCORE
      human
    elsif computer.score == WINNING_SCORE
      computer
    else
      false
    end
  end

  def display_who_won_the_game
    puts "#{who_won?.name} won the game...."
  end

  def ai_offense_defense(marker)
    ai_square = 0
    Board::WINNING_LINES.each_with_index do |winning_line, i|
      risky_line = board.get_risky_square(marker, winning_line)
      ai_square = (winning_line - risky_line)[0] if risky_line.size == 2

      if ai_square != 0 && board.unmarked_keys.include?(ai_square)
        return ai_square
      elsif i == Board::WINNING_LINES.size - 1 && ai_square.zero?
        return nil
      end
    end
  end

  def computer_places_piece
    defensive_square = ai_offense_defense(human.marker)
    offensive_square = ai_offense_defense(computer.marker)
    unmarked_keys = board.unmarked_keys

    square = if offensive_square && unmarked_keys.include?(offensive_square)
               offensive_square
             elsif defensive_square && unmarked_keys.include?(defensive_square)
               defensive_square
             elsif unmarked_keys.include? 5
               5
             else
               unmarked_keys.sample
             end
    board[square] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_places_piece
      @current_marker = human.marker
    end
  end

  def update_score(winning_marker)
    if winning_marker == human.marker
      human.score = human.score + 1
    elsif winning_marker == computer.marker
      computer.score = computer.score + 1
    end
  end

  def display_score
    puts "#{computer.name}'s score = #{computer.score}"
    puts "#{human.name}'s score = #{human.score}"
    sleep(2)
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play