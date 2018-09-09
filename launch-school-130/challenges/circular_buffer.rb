# A circular buffer, cyclic buffer or ring buffer is a data structure that uses
# a single, fixed-size buffer as if it were connected end-to-end.

# A circular buffer first starts empty and of some predefined length. For
# example, this is an empty 7-element buffer:

# [ ][ ][ ][ ][ ][ ][ ]

# Assume that a 1 is written into the middle of the buffer (exact starting
# location does not matter in a circular buffer):

# [ ][ ][ ][1][ ][ ][ ]

# Then assume that two more elements are added, or written to the buffer — 2 & 3
# — which get appended after the 1:

# [ ][ ][ ][1][2][3][ ]

# If two elements are then read, or removed from the buffer, the oldest values
# inside the buffer are removed. The two elements removed, in this case, are 1 &
# 2, leaving the buffer with just a 3:

# [ ][ ][ ][ ][ ][3][ ]

# If the buffer has 7 elements then it is completely full:

# [6][7][8][9][3][4][5]

# When the buffer is full an error will be raised, alerting the client that
# further writes are blocked until a slot becomes free.

# The client can opt to overwrite the oldest data with a forced write. In this
# case, two more elements — A & B — are added and they overwrite the 3 & 4:

# [6][7][8][9][A][B][5]

# Finally, if two elements are now removed then what would be returned is not 3
# & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the buffer with:

# [ ][7][8][9][A][B][ ]

# rules:
  # buff

# data structure:

# algorithm:
  # read:
    # delete oldest elem from buffer and return



# class CircularBuffer
#   %w[Empty Full].each { |e| eval("Buffer#{e}Exception = Class.new(StandardError)") }

#   BufferEmptyException = Class.new(StandardError)
#   BufferFullException = Class.new(StandardError)

#   def initialize(size)
#     # @buffer = Array.new(size) { [] }
#     @size = size
#     clear
#   end

#   def clear
#     @buffer = []
#   end

#   def read
#     # raise BufferEmptyException if @buffer.all?(&:empty?)
#     # raise BufferEmptyException if @buffer.empty?
#     @buffer.shift.tap { |elem| raise BufferEmptyException if elem.nil? }
#   end

#   def write(elem)
#     # return if elem.nil?
#     # @buffer.size == @size ? raise(BufferFullException) : @buffer << elem
#     # @buffer.push(*elem) && (raise BufferFullException if @buffer.size > @size)
#     # @buffer.tap { |b| b.push(*elem) && (raise BufferFullException if @buffer.size > @size) }
#     # return if elem.nil?
#     # full? ? raise(BufferFullException) : @buffer.push(elem)

#     !elem.nil? && (full? ? raise(BufferFullException) : @buffer.push(elem))
#     # @buffer.tap { |b| b.push(*elem) && ( if @buffer.size > @size) }
#   end

#   def write!(elem)
#     # return if elem.nil?
#     # full? ? @buffer.push(elem).shift : write(elem)


#     # full? ? @buffer.tap { |b| b.shift unless elem.nil? }.push(*elem) : write(elem)
#     full? ? @buffer.tap { |b| !elem.nil? && b.shift }.push(*elem) : write(elem)

    # @full[] ? @buffer.tap { |b| !elem.nil? && read }.push(*elem) : write(elem)

    # !elem.nil? && @full[] ? read && write(elem) : write(elem)


#   end

#   def full?
#     @buffer.size == @size
#   end
# end



# class CircularBuffer
#   %w[Empty Full].each { |e| const_set("Buffer#{e}Exception", Class.new(IOError)) }

#   def initialize(size)
#     clear && @full = -> { @buffer.size == size }
#   end

#   def clear; @buffer = [] end

#   def read
#     @buffer.shift.tap { |elem| elem.nil? && raise(BufferEmptyException) }
#   end

#   def write(elem)
#     !elem.nil? && (@full[] ? raise(BufferFullException) : @buffer.push(*elem))
#   end

#   def write!(elem)
#     @full[] ? @buffer.tap { |b| !elem.nil? && read }.push(*elem) : write(elem)
#   end
# end

# def add_ten(num)
#   num + 10
# end




class CircularBuffer
  %w[Empty Full].each { |e| const_set("Buffer#{e}Exception", Class.new(IOError)) }

  def initialize(size)
    clear && @full = -> { @buffer.size == size }
  end

  def clear; @buffer = [] end

  def read
    @buffer.shift.tap { |elem| elem.nil? && raise(BufferEmptyException) }
  end

  def write(elem)
    update(elem) { raise(BufferFullException) }
  end

  def write!(elem)
    update(elem) { read }
  end

  def update(elem)
    return if elem.nil?
    yield if @full[]
    @buffer << elem
  end
end

