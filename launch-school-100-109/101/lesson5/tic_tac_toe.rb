# tic_tac_toe.rb
# frozen_string_literal: true

# Valid options: 'u' for user, 'c' for computer, 't' for coin toss,
#  or 'choose' to let the user decide.
FIRST_PICK = 'choose'
POINTS_TO_WIN = 2
OPEN_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'o'
WELCOME_MSG_WIDTH = 60
GOODBYE_MSG = 'Thank you for playing Tic-Tac-Toe! Goodbye!'
GOODBYE_MSG_WIDTH = GOODBYE_MSG.size
AGAIN_MSG = 'Would you like to play again? (y/n)'
AGAIN_MSG_WIDTH = AGAIN_MSG.size + 3

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_welcome_msg
  clear_screen
  prompt ''.center(WELCOME_MSG_WIDTH, '-')
  prompt 'Welcome to Tic-Tac-Toe!'.center(WELCOME_MSG_WIDTH)
  prompt ''.center(WELCOME_MSG_WIDTH, '-') + "\n\n\n"
end

def display_goodbye_message
  clear_screen
  prompt ''.center(GOODBYE_MSG_WIDTH, '-')
  prompt GOODBYE_MSG
  prompt ''.center(GOODBYE_MSG_WIDTH, '-')
end

# rubocop:disable Metrics/MethodLength
def board_string
  "                 \n" \
  "num0    |num1    |num2    \n" \
  "  char0  |  char1  |  char2  \n" \
  "     |     |     \n" \
  "-----+-----+-----\n" \
  "num3    |num4    |num5    \n" \
  "  char3  |  char4  |  char5  \n" \
  "     |     |     \n" \
  "-----+-----+-----\n" \
  "num6    |num7    |num8    \n" \
  "  char6  |  char7  |  char8  \n" \
  "     |     |     \n" \
  '                 '
end
# rubocop:enable Metrics/MethodLength

def board_current(board)
  current = board_string.dup
  9.times { |idx| current.gsub!("num#{idx}", ' ') }
  board.each_with_index { |c, idx| current.gsub!("char#{idx}", c) }
  current
end

def board_choices(chars_only, nums_only)
  choices = board_string.dup
  nums_only.each_with_index { |n, idx| choices.gsub!("num#{idx}", n.to_s) }
  chars_only.each_with_index { |c, idx| choices.gsub!("char#{idx}", c) }

  choices
end

def combine_boards(board1, board2)
  board1.split("\n").zip(board2.split("\n")).map { |l| l.join(' ' * 15) }
        .join("\n")
end

def empty_location_indices(board)
  board.map.with_index { |mark, idx| idx if mark == OPEN_MARK }.compact
end

def empty_location_nums(board)
  board.map.with_index { |mark, idx| mark == OPEN_MARK ? idx + 1 : mark }
end

def board_possible_choices(board)
  nums_and_chars = empty_location_nums(board)
  chars_only = nums_and_chars.map { |c| c.is_a?(Integer) ? OPEN_MARK : c }
  nums_only = nums_and_chars.map { |c| c.is_a?(Integer) ? c : OPEN_MARK }

  board_choices(chars_only, nums_only)
end

def location_prompt(board)
  <<~MSG
    Please choose a location on the board.
      (Type the number of the location to choose that location)
    => Here are your possible choices:
    #{board_possible_choices(board)}
  MSG
end

def board_rows(board)
  rows = []
  3.times do |idx|
    counter = idx * 3
    rows << board[0 + counter..2 + counter]
  end

  rows
end

def board_columns(board)
  columns = []
  3.times { |idx| columns << [board[idx], board[idx + 3], board[idx + 6]] }

  columns
end

def board_diagonals(board)
  [[board[0], board[4], board[8]], [board[2], board[4], board[6]]]
end

def board_lines(board)
  board_rows(board) + board_columns(board) + board_diagonals(board)
end

def valid_location?(board, location)
  empty_location_nums(board).include?(location)
end

def joinor(ary, separator = ', ', final_separator = 'or')
  return ary.first if ary.size == 1

  separator_ary = [separator] * (ary.size - 1)
  separator_ary[-1] = separator + final_separator + ' '
  ary.zip(separator_ary).join
end

def user_location(board)
  loop do
    location = gets.to_i
    return location if valid_location?(board, location)
    prompt 'Invalid location. You must choose one of the following numbers:'
    puts joinor(empty_location_indices(board).map { |n| n + 1 })
  end
end

def user_turn(board)
  prompt location_prompt(board)
  location = user_location(board) - 1
  clear_screen
  board[location] = PLAYER_MARK

  board_current(board)
end

def block_win_lines(marker)
  [[OPEN_MARK, marker, marker], [marker, OPEN_MARK, marker],
   [marker, marker, OPEN_MARK]]
end

def computer_block_win_rows(rows, marker)
  location = nil
  rows.each_with_index do |row, idx|
    block_win_lines(marker).each_with_index do |line, loc|
      location = loc + (idx * 3) if row == line
    end
  end

  location
end

def computer_block_win_columns(columns, marker)
  location = nil
  columns.each_with_index do |column, idx|
    block_win_lines(marker).each_with_index do |line, loc|
      location = idx + (loc * 3) if column == line
    end
  end

  location
end

def computer_block_win_diagonals(diagonals, marker)
  diagonals_block_win = block_win_lines(marker)
  if diagonals.first == diagonals_block_win.last then 8
  elsif diagonals.last == diagonals_block_win.last then 6
  elsif diagonals.first == diagonals_block_win.first then 0
  elsif diagonals.last == diagonals_block_win.first then 2
  end
end

def computer_block_win(rows, columns, diagonals, marker)
  computer_block_win_rows(rows, marker) ||
    computer_block_win_columns(columns, marker) ||
    computer_block_win_diagonals(diagonals, marker)
end

def computer_edge(board, diagonals)
  location = nil
  diagonals.each do |diagonal|
    next unless diagonal == [PLAYER_MARK, COMPUTER_MARK, PLAYER_MARK]
    [1, 3, 5, 7].shuffle.each do |loc|
      next unless board[loc] == OPEN_MARK
      location = loc
    end
  end

  location
end

def computer_corner(board)
  location = nil
  [0, 2, 6, 8].shuffle.each do |loc|
    next unless board[loc] == OPEN_MARK
    location = loc
  end

  location
end

def computer_first_second_move?(board)
  (8..9).cover?(board.count(OPEN_MARK))
end

def computer_center(board)
  4 if board[4] == OPEN_MARK
end

def computer_third_move?(board)
  board[4] == COMPUTER_MARK && board.count(OPEN_MARK) == 7
end

def computer_third_move_1(board)
  location = nil
  [1, 3, 5, 7].each_with_index do |loc, idx|
    next unless board[loc] == PLAYER_MARK
    location = [[6, 8], [2, 8], [0, 6], [0, 2]][idx].sample
  end

  location
end

def computer_third_move_2(board)
  location = nil
  locations = [0, 2, 6, 8]
  locations.each_with_index do |loc, idx|
    next unless board[loc] == PLAYER_MARK
    location = locations[-(idx + 1)]
  end

  location
end

def computer_random_choice(board)
  empty_location_indices(board).sample
end

def computer_other_moves(board, rows, columns, diagonals)
  computer_block_win(rows, columns, diagonals, COMPUTER_MARK) || # wins
    computer_block_win(rows, columns, diagonals, PLAYER_MARK) || # blocks
    computer_edge(board, diagonals) ||
    computer_corner(board) ||
    computer_random_choice(board)
end

def computer_picks(board, rows, columns, diagonals)
  if computer_first_second_move?(board)
    computer_center(board) || computer_corner(board)
  elsif computer_third_move?(board)
    computer_third_move_1(board) || computer_third_move_2(board)
  else
    computer_other_moves(board, rows, columns, diagonals)
  end
end

def computer_turn(board)
  location = computer_picks(board, board_rows(board), board_columns(board),
                            board_diagonals(board))
  board[location] = COMPUTER_MARK

  board_current(board)
end

def user_win?(board)
  board_lines(board).include?([PLAYER_MARK, PLAYER_MARK, PLAYER_MARK])
end

def computer_win?(board)
  board_lines(board).include?([COMPUTER_MARK, COMPUTER_MARK, COMPUTER_MARK])
end

def tie?(board)
  empty_location_indices(board).empty?
end

def round_over?(board)
  user_win?(board) || computer_win?(board) || tie?(board)
end

def round_winner(board)
  if user_win?(board) then 'user'
  elsif computer_win?(board) then 'computer'
  end
end

def increment_points(winner, points)
  if winner == 'user' then points[:user] += 1
  elsif winner == 'computer' then points[:computer] += 1
  end
end

def display_round_winner(winner)
  if winner == 'user'
    prompt "You (#{PLAYER_MARK}) have won!"
  elsif winner == 'computer'
    prompt "The computer (#{COMPUTER_MARK}) has won!"
  else
    prompt "It's a tie!"
  end
end

def display_round_result(board, winner, points)
  display_round_winner(winner)
  puts "- Your total points:     #{points[:user]} of #{POINTS_TO_WIN}"
  puts "- Computer total points: #{points[:computer]} of #{POINTS_TO_WIN}\n\n"
  prompt 'Final board:'
  puts board_current(board)
end

def round_end(board, points)
  winner = round_winner(board)
  increment_points(winner, points)
  display_round_result(board, winner, points)
end

def display_boards(user_board, computer_board)
  prompt "You (#{PLAYER_MARK}) have chosen:         " \
         "=> The computer (#{COMPUTER_MARK}) has chosen:"
  puts combine_boards(user_board, computer_board)
end

def heads_or_tails
  prompt "Let's flip a coin to decide who goes first!"
  prompt "Type 'h' for heads or 't' for tails:"

  loop do
    coin_side = gets.chomp.downcase
    return coin_side if %w(h t).include?(coin_side)
    prompt "Invalid choice. Please choose: #{joinor(%w(h t))}"
  end
end

def coin_toss_user_win?(coin_side)
  %w(h t).sample == coin_side
end

def display_coin_toss_result(winner)
  if winner == 'u'
    prompt 'You won the coin toss!'
  else
    prompt 'The computer has won the coin toss!'
  end
end

def coin_toss_winner
  coin_side = heads_or_tails
  clear_screen
  winner = coin_toss_user_win?(coin_side) ? 'u' : 'c'
  display_coin_toss_result(winner)

  winner
end

def choose_first_pick
  prompt 'Please select who goes first.'
  prompt "Type 'u' for user, 'c' for computer, or 't' to decide by a coin toss:"

  loop do
    first_choice = gets.chomp.downcase
    return first_choice if %w(u c t).include?(first_choice)
    prompt "Invalid choice. Please choose: #{joinor(%w(u c t))}"
  end
end

def computer_picks_first(board)
  computer_turn(board)

  prompt 'The computer gets to pick first!' + "\n\n"
  prompt "The computer (#{COMPUTER_MARK}) has chosen: "
  puts board_current(board)
end

def first_pick(board)
  first = FIRST_PICK
  first = choose_first_pick if first == 'choose'
  first = coin_toss_winner if first == 't'

  if first == 'c'
    computer_picks_first(board)
  else
    prompt 'You get to pick first!' + "\n\n"
  end
end

def display_round_start(round_num, board)
  prompt "  ROUND #{round_num}"
  puts "(The first one to #{POINTS_TO_WIN} points wins!)"
  prompt 'The board is now empty:'
  puts board_current(board) + "\n"
end

def round_start(round_num, board
)  display_round_start(round_num, board)
  first_pick(board)
end

def turn(board, current_player)
  current_player == 'user' ? user_turn(board) : computer_turn(board)
end

def alternate_player(current_player)
  current_player == 'user' ? 'computer' : 'user'
end

def take_turns(board)
  current_player = 'user'

  until round_over?(board)
    user_board = turn(board, current_player)
    break if round_over?(board)
    current_player = alternate_player(current_player)
    computer_board = turn(board, current_player)
    current_player = alternate_player(current_player)
    display_boards(user_board, computer_board)
  end
end

def play_round(round_num, points)
  board = (OPEN_MARK * 9).chars
  round_start(round_num, board)
  take_turns(board)
  round_end(board, points)
end

def display_match_result(match_num, points)
  if points[:computer] == POINTS_TO_WIN
    prompt "The computer has won Match #{match_num}!"
  else
    prompt "You have won Match #{match_num}!"
  end
end

def display_match_start(match_num)
  prompt "       MATCH #{match_num}"
  puts '__________________________' + "\n\n"
end

def match_over?(points)
  points[:user] == POINTS_TO_WIN || points[:computer] == POINTS_TO_WIN
end

def play_match(match_num)
  points = { user: 0, computer: 0 }
  display_match_start(match_num)

  round_num = 0
  until match_over?(points)
    round_num += 1
    play_round(round_num, points)
  end

  display_match_result(match_num, points)
end

def play_game
  match_num = 0
  loop do
    match_num += 1
    play_match(match_num)
    break unless again?
    clear_screen
  end
end

def valid_again_response?(again)
  %(y n).include?(again)
end

def again_choice
  puts ''.center(AGAIN_MSG_WIDTH, '_') + "\n\n"
  prompt AGAIN_MSG

  loop do
    again = gets.chomp.downcase
    return again if valid_again_response?(again)
    prompt "Invalid response. Please choose: #{joinor(%w(y n))}"
  end
end

def again?
  again_choice == 'y'
end

display_welcome_msg
play_game
display_goodbye_message
