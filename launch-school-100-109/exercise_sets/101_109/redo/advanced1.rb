# advanced1.rb



puts '---------------1----------------'

#  1.     Madlibs Revisited
WORDS = {
  'adjective' => %w(fat angry killer insane fiendish crazy ugliest disgusting
                    terrified vicious oozing flamboyant dubious filthy terrifying
                    spectacular unsightly wicked wild horrible screaming
                    fabulous wrathful slimy frantic lethal massive incompetent
                    magic intoxicated mighty earsplitting miniature bashful
                    defiant ludicrous squealing homeless disturbed pathetic
                    psychotic gigantic monstrous enormous drunk wasted fantastic
                    bloody dying),
  'verb' => %w(scream lick kill excite excite destroy wreck whistle heal wiggle
               smashe attack bathe confuse terrifie burn battle shoot murder
               boil drown hammer squeeze throw execute nail crushe choke bite
               strangle stab decapitate devour mutilate),
  'noun' => %w(cat weasel plumber bear ghost hotdog monkey monster psychopath
               chicken rat panda uncle pie potato kitten Nazi grandma spider
               elf scarecrow zombie king turkey cheese trousers butler
               mother father grandpa donkey dragon lady clown hobo baby bastard
               midget weinerdog gangster),
  'adverb' => %w(suddenly fervently repeatedly recklessly stealthily utterly
                 blissfully jovially wildly foolishly viciously completely
                 accidentally upsettingly unfortunately tenderly frenetically
                 daintily delightfully eagerly needlessly ferociously
                 ceaselessly unflinchingly joyfully angrily gleefully)
}.freeze

def madlib
  text = File.read('madlibs.txt')
  WORDS.keys.each do |type|
    regex = /%\{#{type}\}/
    text.sub!(regex, WORDS[type].sample) while text =~ regex
  end
  text
end

# puts madlib








puts
puts '---------------2----------------'

#  2.     Seeing Stars
def star(n)
  mid = '*' * n
  bot = (0..(n / 2 - 1)).map do |x|
    line = ('*' + (' ' * x) + '*' + (' ' * x) + '*').center(n)
  end
  top = bot.reverse
  puts [top, mid, bot]
end

star(7)
# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
puts

star(9)
# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *
puts
# star(21)







puts
puts '---------------3----------------'

#  3.     Transpose 3x3
def transpose(matrix)
  matrix.first.zip(matrix[1], matrix.last)
end


matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]





puts
puts '---------------4----------------'

#  4.     Transpose MxN
def transpose(matrix)
  transposed = []
  num_rows = matrix.size - 1
  num_columns = matrix.first.size - 1
  0.upto(num_columns) do |column_idx|
    column = []
    0.upto(num_rows) do |row_idx|
      column << matrix[row_idx][column_idx]
    end
    transposed << column
  end
  transposed
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]





puts
puts '---------------5----------------'

#  5.     Rotating Matrices
def rotate90(matrix)
  transpose(matrix).map(&:reverse)
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]
new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2







puts
puts '---------------6----------------'

#  6.     Permutations
def permutations(arr)
  result = []
  arr.size.times { |size| result << rotate(arr, size) }

  arr.size.times do |idx|
    to_rotate = result.dup

    to_rotate.each do |a|
      skip = a[0..idx]
      remaining = a[idx + 1..-1]
      rotate_amount = remaining.size - 1

      1.upto(rotate_amount) do |amount|
        to_add = [*skip, *rotate(remaining, amount)]
        result << to_add
      end
    end
  end

  result.sort
end

def rotate(arr, n)
  [*arr[n..-1], *arr[0...n]].flatten
end



p permutations([2]) ==
  [[2]]

p permutations([1, 2]) ==
  [[1, 2], [2, 1]]

p permutations([1, 2, 3]) ==
  [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

p permutations([1, 2, 3, 4]) ==
   [[1, 2, 3, 4], [1, 2, 4, 3], [1, 3, 2, 4],
    [1, 3, 4, 2], [1, 4, 2, 3], [1, 4, 3, 2],
    [2, 1, 3, 4], [2, 1, 4, 3], [2, 3, 1, 4],
    [2, 3, 4, 1], [2, 4, 1, 3], [2, 4, 3, 1],
    [3, 1, 2, 4], [3, 1, 4, 2], [3, 2, 1, 4],
    [3, 2, 4, 1], [3, 4, 1, 2], [3, 4, 2, 1],
    [4, 1, 2, 3], [4, 1, 3, 2], [4, 2, 1, 3],
    [4, 2, 3, 1], [4, 3, 1, 2], [4, 3, 2, 1]]

a = %w[1 8 6 3 x 9 x]
p permutations(a) == a.permutation(a.size).sort




puts
puts '---------------7----------------'

#  7.     Fix the Bug
def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# is expected to print:
# []
# [21]
# [9, 16]
# [25, 36, 49]







puts
puts '---------------8----------------'

#  8.     Merge Sorted Lists
def merge(arr1, arr2)
  idx1 = 0
  idx2 = 0
  result = []
  while idx1 < arr1.size || idx2 < arr2.size
    if idx2 >= arr2.size || (idx1 < arr1.size && arr1[idx1] < arr2[idx2])
      result << arr1[idx1]
      idx1 += 1
    elsif idx1 >= arr1.size || (idx2 < arr2.size && arr1[idx1] >= arr2[idx2])
      result << arr2[idx2]
      idx2 += 1
    end
  end
  result
end

# def merge(arr1, arr2)
#   small, big = [arr1, arr2].sort_by(&:size)
#   return big if small.empty?
#   result = []
#   idx = 0
#   big.each do |elem|
#     while idx < small.size && small[idx] <= elem
#       result << small[idx]
#       idx += 1
#     end
#     result << elem
#   end
#   result
# end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]






puts
puts '---------------9----------------'

#  9.     Merge Sort
# def merge_sort(arr)
  #   arr = arr.each_slice(arr.size / 2).to_a
  #   # p arr.to_s
  # while arr.to_s =~ /, [^\[]/
  #   p arr
  #     # ;require'pry';binding.pry;
  #   arr.map { |sub| sub.each_slice(sub.size / 2).to_a }
  #   break
  # end
  # arr.to_a
  # until divided.flatten == divided
  #   divided
  #   break
  # end

  # divided = divide(arr)
# end

# def divide(arr)
#   return arr unless arr.to_s =~ /, [^\[]/
#   half = arr.size / 2
#   [divide(arr.take(half)), divide(arr.drop(half))]
# end

def merge_sort(list)
  return list if list.size <= 1
  half = list.size / 2
  left, right = list.take(half),  list.drop(half)
  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []
  until left.empty? || right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result += [*left] + [*right]
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) ==
  %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
  [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

a = [5,7,9,20,1,3,2]
p merge_sort(a)
p a





puts
puts '---------------10----------------'

#  10.    Egyptian Fractions
def egyptian(num)
  result = []
  sum = 0
  denom = 1
  loop do
    current = 1/denom.to_r
    if sum + current <= num
      result << current.denominator
      sum += current
    end
    break if sum == num
    denom += 1
  end
  result
end

def unegyptian(denoms)
  denoms.map { |denom| 1/denom.to_r }.reduce(0, :+)
end




p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
p unegyptian([1,2,3,6])
puts

p egyptian(21/23.to_r)
p egyptian(12/4.to_r)
# p egyptian('0.66'.to_r)
p egyptian(33/50.to_r)








# input: 2d array of maze, and arr of directions
  # maze arr: square of any size NxN
    # key:
      # 0: safe place to walk
      # 1: wall
      # 2: start point
      # 3: end point
  # directions: always upper case N, E, W, S
# output:
  # 'Finish': if reach end point (3) before all moves are gone
  # 'Dead': if hit any walls or go outside maze border
  # 'Lost': if you run out of moves w/o reaching end point
# data structure: 2d arr
# algorithm:
  # find start (current) coords (x, y)
    # iterate thru each row of maze, keeping track of row idx
    # iterate thru each elem in row, keeping track of column idx
      # when hit 2, then coords = row idx, column idx
  # find end point coords (x, y) -> same process as above
  # loop thru each direction, shifting it
    # adjust current coords according to:
      # N: x - 1
      # S: x + 1
      # W: y - 1
      # E: y + 1
    # if x or y is negative or >= maze.size then return 'Dead'
    # if moves.empty? return 'Lost'
    # if current coords == end point coords, rreturn 'Finish'