# input: ...
# output: all possible board positions of 8 quuens following rules
# rules:
  # 8x8 chessboard
  # no two queens can attack each other
    # no 2 queens share same row, column, or diag
# algorithm:
  # find all

# Q _ _ _ _ _ _ _ [0, 0]
# _ _ Q _ _ _ _ _ [1, 2]
# _ _ _ _ Q _ _ _ [2, 4]
# _ _ _ _ _ _ Q _ [3, 6]
# _ _ _ Q _ _ _ _ [4, 3]
# _ Q _ _ _ _ _ _ [5, 1]
# _ _ _ _ _ _ _ Q [6, 7]
# _ _ _ _ _ Q _ _ [7, 5]