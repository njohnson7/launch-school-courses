# computer_moves.rb

def computer_picks(board, rows, columns, diagonals)
  location = computer_center if computer_first_second_move?

  location = ''
  location = computer_corner(board, location)
  location = computer_third_move_1(board, location)
  location = computer_third_move_2(board, location)
  location = computer_edge(board, diagonals, location)
  location = computer_block_win(rows, columns, diagonals, location, PLAYER_MARK) # blocks
  location = computer_block_win(rows, columns, diagonals, location, COMPUTER_MARK) # wins
  location = computer_random_choice(board) if location == ''

  location
end

def computer_picks(board, rows, columns, diagonals)
  location = case board.count(OPEN_MARK)
             when 8, 9
              computer_center(board)
             when 7
              computer_third_move_1(board, location) ||
              computer_third_move_2(board, location)
             end

end






















def block_win_lines(marker)
  [[OPEN_MARK, marker, marker], [marker, OPEN_MARK, marker],
   [marker, marker, OPEN_MARK]]
end

def computer_block_win_rows(rows, location, marker)
  rows.each_with_index do |row, idx|
    block_win_lines(marker).each_with_index do |line, loc|
      location = loc + (idx * 3) if row == line
    end
  end

  location
end

def computer_block_win_columns(columns, location, marker)
  columns.each_with_index do |column, idx|
    block_win_lines(marker).each_with_index do |line, loc|
      location = idx + (loc * 3) if column == line
    end
  end

  location
end

def computer_block_win_diagonals(diagonals, location, marker)
  diagonals_block_win = block_win_lines(marker)
  location = 8 if diagonals.first == diagonals_block_win.last
  location = 6 if diagonals.last == diagonals_block_win.last
  location = 0 if diagonals.first == diagonals_block_win.first
  location = 2 if diagonals.last == diagonals_block_win.first

  location
end

def computer_block_win(rows, columns, diagonals, location, marker)
  location = computer_block_win_rows(rows, location, marker)
  location = computer_block_win_columns(columns, location, marker)
  location = computer_block_win_diagonals(diagonals, location, marker)

  location
end

def computer_edge(board, diagonals, location)
  diagonals.each do |diagonal|
    next unless diagonal == [PLAYER_MARK, COMPUTER_MARK, PLAYER_MARK]
    [1, 3, 5, 7].shuffle.each do |loc|
      next unless board[loc] == ' '
      location = loc
    end
  end

  location
end

def computer_corner(board, location)
  [0, 2, 6, 8].shuffle.each do |loc|
    next unless board[loc] == ' '
    location = loc
  end

  location
end

def computer_first_second_move?(board)
  board.count(OPEN_MARK) == 9 || board.count(OPEN_MARK) == 8
end

def computer_center(board)
  4 if board[4] == OPEN_MARK
end

def computer_third_move?(board)
  board[4] == COMPUTER_MARK && board.count(OPEN_MARK) == 7
end

def computer_third_move_1(board, location)
  if computer_third_move?(board)
    [1, 3, 5, 7].each_with_index do |loc, idx|
      next unless board[loc] == PLAYER_MARK
      location = [[6, 8], [2, 8], [0, 6], [0, 2]][idx].sample
    end
  end

  location
end

def computer_third_move_2(board, location)
  if computer_third_move?(board)
    locations = [0, 2, 6, 8]
    locations.each_with_index do |loc, idx|
      next unless board[loc] == PLAYER_MARK
      location = locations[-(idx + 1)]
    end
  end

  location
end

def computer_random_choice(board)
  empty_location_indices(board).sample
end

def computer_picks(board, rows, columns, diagonals)
  location = case board.count(OPEN_MARK)
             when 8, 9 then computer_center(board)
             end
end

# def computer_picks(board, rows, columns, diagonals)
#   location = computer_center if computer_first_second_move?

#   location = ''
#   location = computer_corner(board, location)
#   location = computer_third_move_1(board, location)
#   location = computer_third_move_2(board, location)
#   location = computer_edge(board, diagonals, location)
#   location = computer_block_win(rows, columns, diagonals, location, PLAYER_MARK) # blocks
#   location = computer_block_win(rows, columns, diagonals, location, COMPUTER_MARK) # wins
#   location = computer_random_choice(board) if location == ''

#   location
# end

# def computer_picks(board, rows, columns, diagonals)
#   return 4 if board[4] == OPEN_MARK

#   location = ''
#   location = computer_corner(board, location)
#   location = computer_third_move_1(board, location)
#   location = computer_third_move_2(board, location)
#   location = computer_edge(board, diagonals, location)
#   location = computer_block_win(rows, columns, diagonals, location, PLAYER_MARK) # blocks
#   location = computer_block_win(rows, columns, diagonals, location, COMPUTER_MARK) # wins
#   location = computer_random_choice(board) if location == ''

#   location
# end

def computer_turn(board)
  location = computer_picks(board, board_rows(board), board_columns(board),
                            board_diagonals(board))
  board[location] = COMPUTER_MARK

  board_current(board)
end