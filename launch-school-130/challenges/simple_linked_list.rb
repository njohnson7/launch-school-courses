# Write a simple linked list implementation that uses Elements and a List.

# The linked list is a fundamental data structure in computer science, often
# used in the implementation of other data structures.

# The simplest kind of linked list is a singly linked list. Each element in the
# list contains data and a "next" field pointing to the next element in the list
# of elements. This variant of linked lists is often used to represent sequences
# or push-down stacks (also called a LIFO stack; Last In, First Out).

# Lets create a singly linked list to contain the range (1..10), and provide
# functions to reverse a linked list and convert to and from arrays.

# class Element
#   attr_reader :datum, :next

#   def initialize(*datum)
#     @datum, @next = datum
#   end

#   def tail?
#     @next.nil?
#   end

#   # def next

#   # end

#   # def each
#   #   block_given? ? datum.each(&proc) : datum.to_enum
#   # end
# end

# Element = Struct.new(:datum, :next) { define_method(:tail?) { self.next.nil? } }

# class SimpleLinkedList
#   # attr_reader :head

#   def self.from_a(arr)
#     # list = new
#     # arr.to_a.reverse_each { |elem| list.push(elem) }
#     # list
#     # list2 = new
#     # arr.to_a.reverse.reduce(list2) { |list, elem| list.push(elem) }
#     # arr.to_a.reverse_each.with_object(new) { |elem, list| list.push(elem) }
#     arr.to_a.reverse.reduce(new) { |list, elem| list.push(elem) }
#   end

#   def initialize
#     @list = []
#     @size = 0
#   end

#   def size
#     @list.size
#   end

#   def empty?
#     @list.empty?
#   end

#   def push(elem)
#     @list << Element.new(elem, @list.last) && self
#   end

#   def peek
#     head&.datum
#     # @list.last&.datum
#     # @head&.datum
#   end

#   def pop
#     @list.pop.datum
#     # @head = @list.last
#   end

#   def head
#     @list.last
#   end

#   def to_a
#     @list.to_a.reverse.map(&:datum)
#   end

#   def reverse
#     self.class.from_a(to_a.reverse)
#   end
# end





  # def pop
  #   datum = @list.pop.datum
  #   head&.next = nil
  #   datum
  # end

  # def pop
  #   @list.pop.datum.tap { head&.next = nil }
  # end




# TAIL TEST!!!!------------------------------------------------------------

# Element = Struct.new(:datum, :next) { define_method(:tail?) { self.next.nil? } }

# class SimpleLinkedList
#   def self.from_a(arr)
#     arr.to_a.reverse.reduce(new) { |list, elem| list.push(elem) }
#   end

#   def initialize
#     @list = []
#   end

#   def size
#     @list.size
#   end

#   def empty?
#     @list.empty?
#   end

#   def push(datum)
#     @list << Element.new(datum, head) && self
#   end

#   def peek
#     head&.datum
#   end

#   def pop
#     @list.pop.datum
#   end

#   def head
#     @list.last
#   end

#   def to_a
#     @list.reverse.map(&:datum)
#   end

#   def reverse
#     self.class.from_a(to_a.reverse)
#   end
# end









class SimpleLinkedList
  FROM_A = [:from_a, -> (a) { a.to_a.reverse.reduce(new) { |l, d| l.push(d) } }]
  METHODS = { initialize: -> { @list = [] },
              head:       -> { @list.last },
              size:       -> { @list.size },
              empty?:     -> { @list.empty? },
              peek:       -> { head&.datum },
              push:       -> (datum) { @list << Element.new(datum, head) && self },
              pop:        -> { @list.pop.datum },
              to_a:       -> { @list.reverse.map(&:datum) },
              reverse:    -> { self.class.from_a(to_a.reverse) } }

  define_singleton_method(*FROM_A)
  METHODS.each { |method| define_method(*method) }
end

Element = Struct.new(:datum, :next) { define_method(:tail?) { self.next.nil? } }
