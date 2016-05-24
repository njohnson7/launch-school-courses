# tic_tac_toe_practice.rb
# frozen_string_literal: true

HASH_ROWS_BLOCK = {
  ['X', 'X', ' '] => 2,
  ['X', ' ', 'X'] => 1,
  [' ', 'X', 'X'] => 0
}.freeze

HASH_COLUMNS_BLOCK = {
  ['X', 'X', ' '] => 2,
  ['X', ' ', 'X'] => 1,
  [' ', 'X', 'X'] => 0
}.freeze

HASH_ROWS_WIN = {
  ['o', 'o', ' '] => 2,
  ['o', ' ', 'o'] => 1,
  [' ', 'o', 'o'] => 0
}.freeze

HASH_COLUMNS_WIN = {
  ['o', 'o', ' '] => 2,
  ['o', ' ', 'o'] => 1,
  [' ', 'o', 'o'] => 0
}.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def display_welcome_msg
  prompt 'Welcome to Tic-Tac-Toe!'.center(60)
  prompt '------------------------------------------------------'.center(60)
  puts
  puts
end

def display_goodbye_message
  clear_screen

  prompt '-------------------------------------------'
  prompt 'Thank you for playing Tic-Tac-Toe. Goodbye!'
  prompt '-------------------------------------------'
  puts
end

def board_current(board)
  <<~MSG
    _____________
    | #{board[0]} | #{board[1]} | #{board[2]} |
    _____________
    | #{board[3]} | #{board[4]} | #{board[5]} |
    _____________
    | #{board[6]} | #{board[7]} | #{board[8]} |
    _____________
  MSG
end

def board_possible_choices(board)
  board = board.clone

  9.times do |idx|
    board[idx] = idx + 1 if board[idx] == ' '
  end

  board_current(board)
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

def valid_int?(num)
  num =~ /^\d+$/
end

def location_nums(board)
  board_possible_choices(board).chars.select do |char|
    valid_int?(char)
  end
end

def valid_location?(board, location)
  location_nums(board).include?(location)
end

def user_location(board)
  loop do
    location = gets.chomp
    return location if valid_location?(board, location)
    prompt 'Invalid location. You must choose one of the following numbers:'
    puts location_nums(board).join(', ')
  end
end

def user_turn(board)
  prompt location_prompt(board)

  location = user_location(board).to_i - 1

  clear_screen

  board[location] = 'X'

  prompt 'You have chosen:'
  puts board_current(board)
  puts
end

def comp_blocks_rows(rows, location)
  rows.each_with_index do |row, idx|
    HASH_ROWS_BLOCK.each do |hash_row, choice|
      location = choice + (idx * 3) if row == hash_row
    end
  end

  location
end

def comp_blocks_columns(columns, location)
  columns.each_with_index do |column, idx|
    HASH_COLUMNS_BLOCK.each do |hash_column, choice|
      location = idx + (choice * 3) if column == hash_column
    end
  end

  location
end

def comp_blocks_diagonals(diagonals, location)
  location = 8 if diagonals[0] == ['X', 'X', ' ']
  location = 6 if diagonals[1] == ['X', 'X', ' ']
  location = 0 if diagonals[0] == [' ', 'X', 'X']
  location = 2 if diagonals[1] == [' ', 'X', 'X']

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
    HASH_ROWS_WIN.each do |hash_row, choice|
      location = choice + (idx * 3) if row == hash_row
    end
  end

  location
end

def comp_wins_columns(columns, location)
  columns.each_with_index do |column, idx|
    HASH_COLUMNS_WIN.each do |hash_column, choice|
      location = idx + (choice * 3) if column == hash_column
    end
  end

  location
end

def comp_wins_diagonals(diagonals, location)
  location = 8 if diagonals[0] == ['o', 'o', ' ']
  location = 6 if diagonals[1] == ['o', 'o', ' ']
  location = 0 if diagonals[0] == [' ', 'o', 'o']
  location = 2 if diagonals[1] == [' ', 'o', 'o']

  location
end

def comp_wins(rows, columns, diagonals, location)
  location = comp_wins_rows(rows, location)

  location = comp_wins_columns(columns, location)

  location = comp_wins_diagonals(diagonals, location)

  location
end

def comp_random_choice(board)
  board_possible_choices(board).chars.select do |c|
    c =~ /\d/
  end.map(&:to_i).sample - 1
end

def comp_picks(board, rows, columns, diagonals)
  return 4 if board[4] == ' '

  location = ''
  location = comp_blocks(rows, columns, diagonals, location)
  location = comp_wins(rows, columns, diagonals, location)
  location = comp_random_choice(board) if location == ''

  location
end

def comp_turn(board)
  location = comp_picks(board, board_rows(board), board_columns(board),
                        board_diagonals(board))
  board[location] = 'o'

  prompt 'The computer has chosen:'
  puts board_current(board)
  puts
  puts
end

def user_win?(board)
  board_lines(board).include?(%w(X X X))
end

def comp_win?(board)
  board_lines(board).include?(%w(o o o))
end

def tie?(board)
  board.count(' ') == 0
end

def game_over?(board)
  user_win?(board) || comp_win?(board) || tie?(board)
end

def game_result(board)
  if user_win?(board) then 'You have won!'
  elsif comp_win?(board) then 'The computer has won.'
  else "It's a tie."
  end
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

  coin_side == heads_or_tails.sample ? true : false
end

def round_start(round_num, board)
  prompt "Round #{round_num}!"
  puts   '------------'

  if user_picks_first?
    prompt 'You won the coin toss, so you get to go first!'
    puts
  else
    prompt 'The computer won the coin toss, so it gets to go first.'
    puts

    comp_turn(board)
  end
end

def play_round(round_num)
  board = (' ' * 9).chars

  round_start(round_num, board)

  loop do
    user_turn(board)
    break prompt game_result(board) if game_over?(board)

    comp_turn(board)
    break prompt game_result(board) if game_over?(board)
  end
end

def again?
  puts '----------------------------------------------'
  puts
  prompt "Would you like to play again? ('y' for yes)"
  again = gets.chomp.downcase
  puts

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
