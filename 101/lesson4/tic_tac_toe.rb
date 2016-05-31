# tic_tac_toe.rb
# frozen_string_literal: true

# Valid options: 'u' for user, 'c' for computer, 't' for coin toss,
#  or 'choose' to let the user decide.
FIRST_PICK = 'choose'

POINTS_TO_WIN = 5

OPEN = ' ' # open square
X = 'X' # user square marker
O = '©' # computer square marker

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_welcome_msg
  clear_screen

  prompt ''.center(60, '-')
  prompt 'Welcome to Tic-Tac-Toe!'.center(60)
  prompt ''.center(60, '-') + "\n\n\n"
end

def display_goodbye_message
  clear_screen

  prompt ''.center(43, '-')
  prompt 'Thank you for playing Tic-Tac-Toe! Goodbye!'
  prompt ''.center(43, '-')
end

# rubocop:disable Metrics/MethodLength
def board_current(board)
  "                 \n" \
  "     |     |     \n" \
  "  #{board[0]}  |  #{board[1]}  |  #{board[2]}  \n" \
  "     |     |     \n" \
  "-----+-----+-----\n" \
  "     |     |     \n" \
  "  #{board[3]}  |  #{board[4]}  |  #{board[5]}  \n" \
  "     |     |     \n" \
  "-----+-----+-----\n" \
  "     |     |     \n" \
  "  #{board[6]}  |  #{board[7]}  |  #{board[8]}  \n" \
  "     |     |     \n" \
  '                 '
end
# rubocop:enable Metrics/MethodLength

def combine_boards(board1, board2)
  board1.split("\n").zip(board2.split("\n")).map { |l| l.join(' ' * 15) }
        .join("\n")
end

# rubocop:disable Metrics/AbcSize
def board_choices(chars_only, nums_only)
  <<~MSG

    #{nums_only[0]}    |#{nums_only[1]}    |#{nums_only[2]}
      #{chars_only[0]}  |  #{chars_only[1]}  |  #{chars_only[2]}
         |     |
    -----+-----+-----
    #{nums_only[3]}    |#{nums_only[4]}    |#{nums_only[5]}
      #{chars_only[3]}  |  #{chars_only[4]}  |  #{chars_only[5]}
         |     |
    -----+-----+-----
    #{nums_only[6]}    |#{nums_only[7]}    |#{nums_only[8]}
      #{chars_only[6]}  |  #{chars_only[7]}  |  #{chars_only[8]}
         |     |
  MSG
end
# rubocop:enable Metrics/AbcSize

def empty_location_indices(board)
  board.map.with_index { |mark, idx| idx if mark == OPEN }.compact
end

def empty_location_nums(board)
  board.map.with_index { |mark, idx| mark == OPEN ? idx + 1 : mark }
end

def board_possible_choices(board)
  nums_and_chars = empty_location_nums(board)

  chars_only = nums_and_chars.map { |char| char.is_a?(Integer) ? OPEN : char }
  nums_only = nums_and_chars.map { |char| char.is_a?(Integer) ? char : OPEN }

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

  board[location] = X

  board_current(board)
end

def block_win_lines(marker)
  [[OPEN, marker, marker], [marker, OPEN, marker], [marker, marker, OPEN]]
end

def comp_block_win_rows(rows, location, marker)
  rows.each_with_index do |row, idx|
    block_win_lines(marker).each_with_index do |line, loc|
      location = loc + (idx * 3) if row == line
    end
  end

  location
end

def comp_block_win_columns(columns, location, marker)
  columns.each_with_index do |column, idx|
    block_win_lines(marker).each_with_index do |line, loc|
      location = idx + (loc * 3) if column == line
    end
  end

  location
end

def comp_block_win_diagonals(diagonals, location, marker)
  diagonals_block_win = block_win_lines(marker)

  location = 8 if diagonals.first == diagonals_block_win.last
  location = 6 if diagonals.last == diagonals_block_win.last
  location = 0 if diagonals.first == diagonals_block_win.first
  location = 2 if diagonals.last == diagonals_block_win.first

  location
end

def comp_block_win(rows, columns, diagonals, location, marker)
  location = comp_block_win_rows(rows, location, marker)
  location = comp_block_win_columns(columns, location, marker)
  location = comp_block_win_diagonals(diagonals, location, marker)

  location
end

def comp_edge(board, diagonals, location)
  diagonals.each do |diagonal|
    next unless diagonal == [X, O, X]
    [1, 3, 5, 7].shuffle.each do |loc|
      next unless board[loc] == ' '
      location = loc
    end
  end

  location
end

def comp_corner(board, location)
  [0, 2, 6, 8].shuffle.each do |loc|
    next unless board[loc] == ' '
    location = loc
  end

  location
end

def comp_third_move?(board)
  board[4] == O && board.count(OPEN) == 7
end

def comp_third_move_1(board, location)
  if comp_third_move?(board)
    [1, 3, 5, 7].each_with_index do |loc, idx|
      next unless board[loc] == X
      location = [[6, 8], [2, 8], [0, 6], [0, 2]][idx].sample
    end
  end

  location
end

def comp_third_move_2(board, location)
  if comp_third_move?(board)
    locations = [0, 2, 6, 8]
    locations.each_with_index do |loc, idx|
      next unless board[loc] == X
      location = locations[-(idx + 1)]
    end
  end

  location
end

def comp_random_choice(board)
  empty_location_indices(board).sample
end

def comp_picks(board, rows, columns, diagonals)
  return 4 if board[4] == OPEN

  location = ''
  location = comp_corner(board, location)
  location = comp_third_move_1(board, location)
  location = comp_third_move_2(board, location)
  location = comp_edge(board, diagonals, location)
  location = comp_block_win(rows, columns, diagonals, location, X) # blocks
  location = comp_block_win(rows, columns, diagonals, location, O) # wins
  location = comp_random_choice(board) if location == ''

  location
end

def comp_turn(board)
  location = comp_picks(board, board_rows(board), board_columns(board),
                        board_diagonals(board))
  board[location] = O

  board_current(board)
end

def user_win?(board)
  board_lines(board).include?([X, X, X])
end

def comp_win?(board)
  board_lines(board).include?([O, O, O])
end

def tie?(board)
  empty_location_indices(board).empty?
end

def game_over?(board)
  user_win?(board) || comp_win?(board) || tie?(board)
end

def game_result(board, points)
  if user_win?(board)
    points[:user] += 1
    "You (#{X}) have won!"
  elsif comp_win?(board)
    points[:comp] += 1
    "The computer (#{O}) has won!"
  else
    "It's a tie!"
  end
end

def display_boards(user_board, comp_board)
  prompt "You (#{X}) have chosen:         => The computer (#{O}) has chosen:"
  puts combine_boards(user_board, comp_board)
end

def display_game_result(board, points)
  prompt game_result(board, points)
  puts "- Your total points:     #{points[:user]} of #{POINTS_TO_WIN}"
  puts "- Computer total points: #{points[:comp]} of #{POINTS_TO_WIN}" + "\n\n"
  prompt 'Final board:'
  puts board_current(board)
end

def heads_or_tails
  prompt "Let's flip a coin to decide who goes first!"
  prompt "Type 'h' for heads or 't' for tails:"

  coin_side = ''
  loop do
    coin_side = gets.chomp.downcase
    break if %w(h t).include?(coin_side)
    prompt "Invalid choice. Please choose: #{joinor(%w(h t))}"
  end

  clear_screen

  coin_side
end

def coin_toss_user_win?
  if %w(h t).sample == heads_or_tails
    prompt 'You won the coin toss!'
    true
  else
    prompt 'The computer has won the coin toss!'
    false
  end
end

def choose_first_pick
  prompt 'Please select who goes first.'
  prompt "Type 'u' for user, 'c' for computer, or 't' to decide by a coin toss:"

  loop do
    first_choice = gets.chomp.downcase
    return first_choice if %w(u c t).include?(first_choice)
    prompt "Invalid choice. Please choose: #{joinor(%w(u c t))}"
  end

  puts "\n"
end

def comp_picks_first(board)
  comp_turn(board)

  prompt 'The computer gets to pick first!' + "\n\n"
  prompt "The computer (#{O}) has chosen: "
  puts board_current(board)
end

def first_pick(board)
  first = FIRST_PICK

  first = choose_first_pick if first == 'choose'

  first = coin_toss_user_win? ? 'u' : 'c' if first == 't'

  first == 'c' ? comp_picks_first(board) : prompt("You get to pick first!\n\n")
end

def round_start(round_num, board)
  prompt "  ROUND #{round_num}"
  puts "(The first one to #{POINTS_TO_WIN} points wins!)"
  prompt 'The board is now empty:'
  puts board_current(board) + "\n"

  first_pick(board)
end

def turn(board, current_player)
  current_player == 'user' ? user_turn(board) : comp_turn(board)
end

def alternate_player(current_player)
  current_player == 'user' ? 'comp' : 'user'
end

def take_turns(board, points)
  current_player = 'user'

  loop do
    user_board = turn(board, current_player)

    break display_game_result(board, points) if game_over?(board)

    current_player = alternate_player(current_player)

    comp_board = turn(board, current_player)

    current_player = alternate_player(current_player)

    display_boards(user_board, comp_board)

    break display_game_result(board, points) if game_over?(board)
  end
end

def play_round(round_num, points)
  board = (OPEN * 9).chars

  round_start(round_num, board)

  take_turns(board, points)
end

def display_match_result(match_num, points)
  if points[:comp] == POINTS_TO_WIN
    prompt "The computer has won Match #{match_num}!"
  else
    prompt "You have won Match #{match_num}!"
  end
end

def play_match(match_num)
  points = { user: 0, comp: 0 }
  prompt "       MATCH #{match_num}"
  puts '__________________________' + "\n\n"

  round_num = 0
  until points[:user] == POINTS_TO_WIN || points[:comp] == POINTS_TO_WIN
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

def again?
  puts '______________________________________________' + "\n\n"
  prompt "Would you like to play again? ('y' for yes)"
  again = gets.chomp.downcase
  puts "\n"

  again.start_with?('y')
end

display_welcome_msg

play_game

display_goodbye_message
