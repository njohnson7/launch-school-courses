# tic_tac_toe_practice.rb
# frozen_string_literal: true

OPEN = ' '
X = 'X'
O = '©'

HASH_BLOCK = {
  [X, X, OPEN] => 2,
  [X, OPEN, X] => 1,
  [OPEN, X, X] => 0
}.freeze

HASH_WIN = {
  [O, O, OPEN] => 2,
  [O, OPEN, O] => 1,
  [OPEN, O, O] => 0
}.freeze

DIAGONALS_BLOCK = [
  [X, X, OPEN],
  [OPEN, X, X]
].freeze

DIAGONALS_WIN = [
  [O, O, OPEN],
  [OPEN, O, O]
].freeze

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_welcome_msg
  prompt 'Welcome to Tic-Tac-Toe!'.center(60)
  prompt ''.center(60, '-') + "\n\n\n"
end

def display_goodbye_message
  clear_screen

  prompt '-------------------------------------------'
  prompt 'Thank you for playing Tic-Tac-Toe! Goodbye!'
  prompt '-------------------------------------------'
end

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

def combine_boards(brd1, brd2)
  board1.split("\n").zip(board2.split("\n")).map { |l| l.join(' ' * 14) }
        .join("\n")
end

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

def empty_location_indices(board)
  board.map.with_index { |c, idx| idx if c == OPEN }.compact
end

def empty_location_nums(board)
  board.map.with_index do |c, idx|
    c == OPEN ? idx + 1 : c
  end
end

def board_possible_choices(board)
  nums_and_chars = empty_location_nums(board)
  chars_only = nums_and_chars.map { |c| c.is_a?(Integer) ? OPEN : c }
  nums_only = nums_and_chars.map { |c| c.is_a?(Integer) ? c : OPEN }
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

def user_location(board)
  loop do
    location = gets.to_i

    return location if valid_location?(board, location)

    prompt 'Invalid location. You must choose one of the following numbers:'
    puts empty_location_indices(board).map { |n| n + 1 }.join(', ')
  end
end

def user_turn(board)
  prompt location_prompt(board)

  location = user_location(board) - 1

  clear_screen

  board[location] = X

  board_current(board)
end

def comp_blocks_rows(rows, location)
  rows.each_with_index do |row, idx|
    HASH_BLOCK.each do |hash_row, choice|
      location = choice + (idx * 3) if row == hash_row
    end
  end

  location
end

def comp_blocks_columns(columns, location)
  columns.each_with_index do |column, idx|
    HASH_BLOCK.each do |hash_column, choice|
      location = idx + (choice * 3) if column == hash_column
    end
  end

  location
end

def comp_blocks_diagonals(diagonals, location)
  location = 8 if diagonals[0] == DIAGONALS_BLOCK[0]
  location = 6 if diagonals[1] == DIAGONALS_BLOCK[0]
  location = 0 if diagonals[0] == DIAGONALS_BLOCK[1]
  location = 2 if diagonals[1] == DIAGONALS_BLOCK[1]

  location
end

def comp_blocks(rows, columns, diagonals, location)
  location = comp_blocks_rows(rows, location)

  location = comp_blocks_columns(columns, location)

  location = comp_blocks_diagonals(diagonals, location)

  location
end

def comp_wins_rows(rows, location)
  rows.each_with_index do |row, idx|
    HASH_WIN.each do |hash_row, choice|
      location = choice + (idx * 3) if row == hash_row
    end
  end

  location
end

def comp_wins_columns(columns, location)
  columns.each_with_index do |column, idx|
    HASH_WIN.each do |hash_column, choice|
      location = idx + (choice * 3) if column == hash_column
    end
  end

  location
end

def comp_wins_diagonals(diagonals, location)
  location = 8 if diagonals[0] == DIAGONALS_WIN[0]
  location = 6 if diagonals[1] == DIAGONALS_WIN[0]
  location = 0 if diagonals[0] == DIAGONALS_WIN[1]
  location = 2 if diagonals[1] == DIAGONALS_WIN[1]

  location
end

def comp_wins(rows, columns, diagonals, location)
  location = comp_wins_rows(rows, location)

  location = comp_wins_columns(columns, location)

  location = comp_wins_diagonals(diagonals, location)

  location
end

def comp_random_choice(board)
  empty_location_indices(board).sample
end

def comp_picks(board, rows, columns, diagonals)
  return 4 if board[4] == OPEN

  location = ''
  location = comp_blocks(rows, columns, diagonals, location)
  location = comp_wins(rows, columns, diagonals, location)
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

def game_result(board)
  if user_win?(board) then "You (#{X}) have won!"
  elsif comp_win?(board) then "The computer (#{O}) has won!"
  else "It's a tie!"
  end
end

def display_boards(user_board, comp_board)
  prompt "You (#{X}) have chosen :        => The computer (#{O}) has chosen:"
  puts combine_boards(user_board, comp_board)
end

def display_game_result(board)
  prompt game_result(board)
  prompt 'Final board:'
  puts board_current(board)
end

def user_picks_first?
  heads_or_tails = %w(h t)

  prompt "Let's flip a coin to decide who goes first!"
  prompt "Type 'h' for heads or 't' for tails:"

  coin_side = ''
  loop do
    coin_side = gets.chomp.downcase
    break if heads_or_tails.include?(coin_side)
    prompt "Invalid choice. Please choose 'h' or 't'"
  end

  clear_screen

  coin_side == heads_or_tails.sample ? true : false
end

def round_start(round_num, board)
  prompt "  ROUND #{round_num}"
  prompt 'The board is currently empty:'
  puts board_current(board) + "\n"

  if user_picks_first?
    prompt 'You won the coin toss, so you get to go first!' + "\n\n"
  else
    prompt 'The computer won the coin toss, so it gets to go first.' + "\n\n"
    comp_turn(board)
  end
end

def play_round(round_num)
  board = (OPEN * 9).chars

  round_start(round_num, board)

  loop do
    user_board = user_turn(board)
    break display_game_result(board) if game_over?(board)

    comp_board = comp_turn(board)
    display_boards(user_board, comp_board)
    break display_game_result(board) if game_over?(board)
  end
end

def again?
  puts '______________________________________________' + "\n\n"
  prompt "Would you like to play again? ('y' for yes)"
  again = gets.chomp.downcase
  puts "\n"

  again.start_with?('y')
end

clear_screen

display_welcome_msg

round_num = 0
loop do
  round_num += 1

  play_round(round_num)

  break unless again?

  clear_screen
end

display_goodbye_message
