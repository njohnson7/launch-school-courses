# one = "+------------+\n|          |\n|            |\n|            |\n+------+-----+\n|      |     |\n|      |     |\n+------+-----+"  # => "+------------+\n|          |\n|            |\n|            |\n+------+-----+\n|      |     |\n|      |     |\n+------+-----+"

# two = "+-------------------+--+\n|                   |  |\n|                   |  |\n|  +----------------+  |\n|  |                   |\n|  |                   |\n+--+-------------------+"  # => "+-------------------+--+\n|                   |  |\n|                   |  |\n|  +----------------+  |\n|  |                   |\n|  |                   |\n+--+-------------------+"

# three = "           +-+             \n           | |             \n         +-+-+-+           \n         |     |           \n      +--+-----+--+        \n      |           |        \n   +--+-----------+--+     \n   |                 |     \n   +-----------------+     "  # => "           +-+             \n           | |             \n         +-+-+-+           \n         |     |           \n      +--+-----+--+        \n      |           |        \n   +--+-----------+--+     \n   |             ...

# four = "+-----------------+\n|                 |\n|   +-------------+\n|   |\n|   |\n|   |\n|   +-------------+\n|                 |\n|                 |\n+-----------------+"  # => "+-----------------+\n|                 |\n|   +-------------+\n|   |\n|   |\n|   |\n|   +-------------+\n|                 |\n|                 |\n+-----------------+"

# five = "+---+---+---+---+---+---+---+---+\n|   |   |   |   |   |   |   |   |\n+---+---+---+---+---+---+---+---+"  # => "+---+---+---+---+---+---+---+---+\n|   |   |   |   |   |   |   |   |\n+---+---+---+---+---+---+---+---+"

# six = "+---+------------+---+\n|   |            |   |\n+---+------------+---+\n|   |            |   |\n|   |            |   |\n|   |            |   |\n|   |            |   |\n+---+------------+---+\n|   |            |   |\n+---+------------+---+"  # => "+---+------------+---+\n|   |            |   |\n+---+------------+---+\n|   |            |   |\n|   |            |   |\n|   |            |   |\n|   |            |   |\n+---+------------+---+\n|   |            |   |\n+---+------------+---+"

# seven = "                 \n   +-----+       \n   |     |       \n   |     |       \n   +-----+-----+ \n         |     | \n         |     | \n         +-----+ "  # => "                 \n   +-----+       \n   |     |       \n   |     |       \n   +-----+-----+ \n         |     | \n         |     | \n         +-----+ "
# puts four                                                                                                                                                         # => nil

# shape = ["+------------+",             # => "+------------+"
#          "|            |",             # => "|            |"
#          "|            |",             # => "|            |"
#          "|            |",             # => "|            |"
#          "+------+-----+",             # => "+------+-----+"
#          "|      |     |",             # => "|      |     |"
#          "|      |     |",             # => "|      |     |"
#          "+------+-----+"].join("\n")  # => "+------------+\n|            |\n|            |\n|            |\n+------+-----+\n|      |     |\n|      |     |\n+------+-----+"

# # >> +-----------------+
# # >> |                 |
# # >> |   +-------------+
# # >> |   |
# # >> |   |
# # >> |   |
# # >> |   +-------------+
# # >> |                 |
# # >> |                 |
# # >> +-----------------+

def head(arr)
  arr.first
end

def tail(arr)
  arr.drop(1)
end

def init(arr)
  arr[0...-1]
end

def last(arr)
  arr.last
end


# p head([5,1])      # 5
# p tail([1])        # []
# p init([1,5,7,9])  # [1,5,7]
# p last([7,2])      # 2




def collatz(n)
  1 + (n == 1 ? 0 : collatz(n.even? ? n / 2 : n * 3 + 1))
end


# collatz(20)
# # 8
# collatz(15)
# # 18



# arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]  # => [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# arr.drop(1)                              # => [[4, 5, 6], [7, 8, 9]]
# arr.first.zip(arr.drop(1))               # => [[1, [4, 5, 6]], [2, [7, 8, 9]], [3, nil]]
# arr.first.zip(*arr.drop(1))              # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# arr.first.zip([4, 5, 6], [7, 8, 9])      # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# [1, 2, 3].zip([])                        # => [[1, nil], [2, nil], [3, nil]]
# [1, 2, 3].zip(*[])                       # => [[1], [2], [3]]
# a = *[]                                  # => []


def get_sum(a,b)
  return a if a == b
  sum = 0
  a > b ? (a..b).each { |num| sum += num } : (b..a).each { |num| sum += num }
  sum
end

# get_sum(0,1)   # => 0
# get_sum(0,-1)  # => 0
# get_sum(1,2)   # => 0
# get_sum(5,-1)  # => 0







def flatten_and_sort(array)
  array.flatten.sort
end




p flatten_and_sort([[]]) # [])
p flatten_and_sort([[], []]) # [])
p flatten_and_sort([[], [1]]) # [1])
p flatten_and_sort([[], [], [], [2], [], [1]]) # [1, 2])
p flatten_and_sort([[3, 2, 1], [7, 9, 8], [6, 4, 5]]) # [1, 2, 3, 4, 5, 6, 7, 8, 9])
p flatten_and_sort([[1, 3, 5], [100], [2, 4, 6]]) # [1, 2, 3, 4, 5, 6, 100])
p flatten_and_sort([[111, 999], [222], [333], [444], [888], [777], [666], [555]]) # [111, 222, 333, 444, 555, 666, 777, 888, 999])
p flatten_and_sort([[9, 7, 5, 3, 1], [8, 6, 4, 2, 0], [], [1]]) # [0, 1, 1, 2, 3, 4, 5, 6, 7, 8, 9])
p flatten_and_sort([[1], [], [1], [], [], [-1, -2, -1], [0, 3], [1], [2]]) # [-2, -1, -1, 0, 1, 1, 1, 2, 3])
p flatten_and_sort([[], [], [64], [], [504, 503], [4096], [], [303], [202], [2500], [], [100]]) # [64, 100, 202, 303, 503, 504, 2500, 4096])
p flatten_and_sort([[90, 81, 72], [63, 54, 35], [], [46], [27, 18, 0]]) # [0, 18, 27, 35, 46, 54, 63, 72, 81, 90])
p flatten_and_sort([[1], [], [1], [1], [0], [-1], [], [0], [-1], [0], [-1]]) # [-1, -1, -1, 0, 0, 0, 1, 1, 1])
p flatten_and_sort([[-9, -8, -7, -6, -5, -4, -3, -2, -1]]) # [-9, -8, -7, -6, -5, -4, -3, -2, -1])
p flatten_and_sort([[9, 8, 7, 6, 5, 4, 3, 2, 1]]) # [1, 2, 3, 4, 5, 6, 7, 8, 9])