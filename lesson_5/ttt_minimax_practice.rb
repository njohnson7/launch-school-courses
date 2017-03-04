# ttt_minimax_practice.rb

WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8]] + # rows
                [[0, 3, 6], [1, 4, 7], [2, 5, 8]] + # columns
                [[0, 4, 8], [2, 4, 6]]              # diagonals

#     |   |
#   O |   | X
#  ___|___|___
#     |   |
#   X |   | X
#  ___|___|___
#     |   |
#     | O | O
#     |   |

#     |   |
#   O | X | O
#  ___|___|___
#     |   |
#     | X |
#  ___|___|___
#     |   |
#   O |   |
#     |   |
 # origBoard = ["O",1 ,"X","X",4 ,"X", 6 ,"O","O"];
# orig_board = ['O', 1, 'X', 'X', 'O', 5, 6, 'O', 8]
orig_board = ['O', 'X', 'O', 4, 'X', 5, 'O', 7, 8]
HUMAN = 'O'
COMPUTER = 'X'


def empty_indexes(board)
  board.reject { |sq| %w[X O].include?(sq) }
end

def winning?(board, player)
  WINNING_LINES.any? do |line|
    sqs = board.values_at(*line)
    sqs.first == player && sqs.uniq.size == 1
  end
end

# p empty_indexes(orig_board)
# p winning?(orig_board, HUMAN)

def minimax(new_board, player)
  empty_indexes = empty_indexes(new_board)

  if winning?(new_board, HUMAN)       then return { score: -10 }
  elsif winning?(new_board, COMPUTER) then return { score: 10 }
  elsif empty_indexes.empty?          then return { score: 0 }
  end

  moves = []
  empty_indexes.each do |idx|
    move = {}
    move[:index] = new_board[idx]
    new_board[idx] = player

    if player == COMPUTER
      result = minimax(new_board, HUMAN)
      move[:score] = result[:score]
    else
      result = minimax(new_board, COMPUTER)
      move[:score] = result[:score]
    end

    new_board[idx] = move[:index]

    moves << move
  end

  best_move = nil
  if player == COMPUTER
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
  moves[best_move]
end

p minimax(orig_board, COMPUTER)