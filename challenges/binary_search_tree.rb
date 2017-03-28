# node containing the data 4 -> add the data 2:
#   4
#  /
# 2

# add 6:
#   4
#  / \
# 2   6

# add 3:
#    4
#  /   \
# 2     6
#  \
#   3

# add 1, 5, and 7:
#       4
#     /   \
#    /     \
#   2       6
#  / \     / \
# 1   3   5   7

# rules:
  # Bst = series of connected nodes
    # each node contains:
      # a piece of data (ex: 3)
      # vars: left, right
        # point at nil or other nodes (subtrees)
  # all data in left subtree is <= current node's data
  # all data in right subtree is > current node's data
# algorithm:
  # insert data:
    # if new data <=

class Bst
  attr_reader :data, :left, :right

  def initialize(num)
    @data = num
  end

  def insert(num)
    node = num <= data ? :left : :right
    send(node)&.insert(num) || instance_variable_set("@#{node}", Bst.new(num))
  end

  def each
    return to_enum unless block_given?
    left&.each(&proc)
    proc.call(data)
    right&.each(&proc)
  end
end

# p Bst.new(4)
# tree = Bst.new 4
# [2, 1, 3, 6, 7, 5].each { |x| tree.insert x }




  # def insert(new_data)
  #   if new_data <= data
  #     left ? left.insert(new_data) : @left = Bst.new(new_data)
  #   else
  #     right ? right.insert(new_data) : @right = Bst.new(new_data)
  #   end
  # end

  # def each(&block)
  #   return to_enum unless block_given?
  #   if left
  #     left.each(&block)
  #     yield data
  #   else
  #     yield data
  #   end
  #   right.each(&block) if right
  # end



  # def insert(num)
  #   node = num <= data ? [:left, left]: [:right, right]
  #   node.last&.insert(num) || instance_variable_set("@#{node.first}", Bst.new(num))
  # end