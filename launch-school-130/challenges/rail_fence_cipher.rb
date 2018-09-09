# 'WE ARE DISCOVERED FLEE AT ONCE'
#   W . . . E . . . C . . . R . . . L . . . T . . . E . . .
#   . E . R . D . S . O . E . E . F . E . A . O . C .
#   . . A . . . I . . . V . . . D . . . E . . . N . . .

# [["W", "E", "C", "R", "L", "T", "E"],
#  ["E", "R", "D", "S", "O", "E", "E", "F", "E", "A", "O", "C"],
#  ["A", "I", "V", "D", "E", "N"]]

# p encrypt('HI EVERYONE THIS IS SUPER COOL', 5) == 'HNSLIOESUOEYTIPOVRHSECEIR'
# # h       n       s       l
# #  i     o e     s u     o
# #   e   y   t   i   p   o
# #    v r     h s     e c
# #     e       i       r
# # 'HNSLIOESUOEYTIPOVRHSECEIR'




module RailFenceCipher
  def self.encode(str, num)
    rails_info(str, num).join
  end

  def self.decode(str, num)
    indexes = indexes(num, str.size)
    rails_sizes = rails_info(str, num).map(&:size)
    rails = rails_sizes.map { |size| str.slice!(0, size).chars }
    indexes.reduce('') { |result, idx| result + rails[idx].shift }
  end

  def self.indexes(num, str_size)
    ([*0...num, *(num - 2).downto(1)] * str_size).take(str_size)
  end

  def self.rails_info(str, num)
    rails = Array.new(num) { [] }
    indexes = indexes(num, str.size)
    str.each_char.with_index { |char, idx| rails[indexes[idx]] << char } && rails
  end
end








module RailFenceCipher
  def self.encode(str, num_rails)
    rails_info(str, num_rails)[:rails].join
  end

  def self.decode(str, num_rails)
    rails_sizes, indices = rails_info(str, num_rails).values_at(:sizes, :indices)
    rails = rails_sizes.map { |size| str.slice!(0, size).chars }
    indices.reduce('') { |decoded_str, idx| decoded_str + rails[idx].shift }
  end

  def self.rails_info(str, num_rails)
    rails = Array.new(num_rails) { [] }
    indices = generate_indices(str, num_rails)
    str.each_char.with_index { |char, idx| rails[indices[idx]] << char }
    { rails: rails, sizes: rails.map(&:size), indices: indices }
  end

  def self.generate_indices(str, num_rails)
    ([*0...num_rails, *(num_rails - 2).downto(1)] * str.size).take(str.size)
  end
end


# p RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3)
# p RailFenceCipher.decode("WECRLTEERDSOEEFEAOCAIVDEN", 3)
# p RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)
