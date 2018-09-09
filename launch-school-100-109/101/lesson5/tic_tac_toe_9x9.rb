# tic_tac_toe_9x9.rb
# frozen_string_literal: true

# UNFINISHED!

OPEN = ' '
X = 'X'
O = '©'
BOARD_LINE = "     |     |     |     |     |     |     |     |     "
BOARD_DIVIDER = "-----+-----+-----+-----+-----+-----+-----+-----+-----"

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

def joinor(ary, delimiter = ', ', word = 'or')
  ary[-1] = "#{word} #{ary.last}" if ary.size > 1
  ary.join(delimiter)
end

def display_board(board)
  puts ' ' * 53
  9.times do |idx|
    puts BOARD_LINE
    puts "  #{board[0 + idx * 9]}  |  #{board[1 + idx * 9]}  |" \
         "  #{board[2 + idx * 9]}  |  #{board[3 + idx * 9]}  |" \
         "  #{board[4 + idx * 9]}  |  #{board[5 + idx * 9]}  |" \
         "  #{board[6 + idx * 9]}  |  #{board[7 + idx * 9]}  |" \
         "  #{board[8 + idx * 9]}   (#{(idx * 9) + 1} - #{(idx + 1) * 9})"
   puts BOARD_LINE
   puts BOARD_DIVIDER if idx < 8
  end
  puts ' ' * 53
end

def board_rows(board)
  rows = []

  9.times do |idx|
    counter = idx * 9
    rows << board[0 + counter..8 + counter]
  end

  rows
end

# TO DO:
# def board_columns(board)
#   columns = []

#   9.times { |idx| columns << [board[idx], board[idx + 9], board[idx + 18]] }

#   columns
# end

def empty_squares(board)
  empty_square_nums = []
  board.each_with_index do |square, idx|
    empty_square_nums << idx + 1 if square == OPEN
  end
  empty_square_nums
end

def valid_square?(board, square)
  empty_squares(board).include?(square)
end

def user_square(board)
  prompt 'Please choose one of the following open squares:'

  loop do
    puts joinor(empty_squares(board))
    square = gets.to_i

    return square - 1 if valid_square?(board, square)

    prompt 'Invalid square number. You must choose one of the following numbers:'
  end
end

def comp_square(board)
  square = empty_squares(board).sample - 1
end

def player_turn(board, current_player)
  board[user_square(board)] = X if current_player == 'user'
  if current_player == 'comp1' || current_player == 'comp2'
    board[comp_square(board)] = O
  end
end

def alternate_player(current_player)
  return 'comp1' if current_player == 'user'
  return 'comp2' if current_player == 'comp1'
  return 'user' if current_player == 'comp2'
end

board = (' ' * 81).chars

current_player = 'user'
loop do
  display_board(board)
  player_turn(board, current_player)
  current_player = alternate_player(current_player)
  # board_rows(board).each { |row| p row }
end
