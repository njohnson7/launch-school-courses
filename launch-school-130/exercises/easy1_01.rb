# easy1_01.rb

# Assume we have a Tree class that implements a binary tree.

# class Tree
#   ...
# end

# A binary tree is just one of many forms of collections, such as Arrays,
# Hashes, Stacks, Sets, and more. All of these collection classes include the
# Enumerable module, which means they have access to an each method, as well as
# many other iterative methods such as map, reduce, select, and more.

# For this exercise, modify the Tree class to support the methods of Enumerable.
# You do not have to actually implement any methods -- just show the methods
# that you must provide.

# class Tree
#   # include Enumerable

#   def each
#     #...
#   end
# end

# Tree = Class.new { define_method(:each) {  } }
# Tree.extend(Enumerable)
Tree = Class.new { include(Enumerable) && define_method(:each) { 'each' } }


tree = Tree.new
p tree.each { |n| p n + 1}
p tree.each
p tree.map(&:to_s)
p tree.map
