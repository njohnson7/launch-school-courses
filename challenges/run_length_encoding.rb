# Implement run-length encoding and decoding.

# Run-length encoding (RLE) is a simple form of data compression, where runs
# (consecutive data elements) are replaced by just one data value and count.

# For example we can represent the original 53 characters with only 13.

# "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"

# RLE allows the original data to be perfectly reconstructed from the compressed
# data, which makes it a lossless data compression.

# "AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"


module RunLengthEncoding
  define_singleton_method(:encode) { |s| s.gsub(/(.)\1+/) { |m| "#{m.size}#{m[0]}"} }
  define_singleton_method(:decode) { |s| s.gsub(/(\d+)(.)/) { $2 * $1.to_i } }
end

# using String#gsub and regex:
module RunLengthEncoding
  def self.encode(str)
    str.gsub(/(.)\1+/) { |match| "#{match.size}#{match[0]}" }
  end

  def self.decode(str)
    str.gsub(/(\d+)(.)/) { $2 * $1.to_i }
  end
end


# using Array and Enumerable methods:
module RunLengthEncoding
  def self.encode(str)
    str.chars
       .chunk(&:itself)
       .map { |_, arr| "#{arr.size if arr.size > 1}#{arr.first}" }.join
  end

  def self.decode(str)
    str.chars
       .chunk       { |char| ('0'..'9').include?(char) }
       .flat_map    { |bool, arr| bool ? arr.join.to_i : arr }
       .chunk_while { |a, b| a.is_a?(Integer) && b.is_a?(String) }
       .map         { |a, b| b ? b * a : a }
       .join
  end
end


# Iterating over each character exactly one time, without using any regex or indexes - using String#each_char:
module RunLengthEncoding
  def self.encode(str)
    last_seen = str.slice!(0)
    count = 1
    "#{str}\t".each_char.with_object('') do |char, result|
      next count += 1 if last_seen == char
      result << "#{count if count > 1}#{last_seen}"
      last_seen = char
      count = 1
    end
  end

  def self.decode(str)
    num = ''
    str.each_char.with_object('') do |char, result|
      next num << char if ('0'..'9').include?(char)
      result << (num.empty? ? char : char * num.to_i)
      num = ''
    end
  end
end


# Iterating over each character exactly one time, without using any regex - using indexes and while loop:
module RunLengthEncoding
  def self.encode(str)
    result = ''
    count = 1
    last_seen = ''
    idx = -1
    while idx < str.size
      idx += 1
      char = str[idx]
      next count += 1 unless last_seen != char || idx == str.size
      result << "#{count if count > 1}#{last_seen}"
      last_seen = char
      count = 1
    end
    result
  end

  def self.decode(str)
    result = ''
    num = ''
    idx = -1
    while idx < str.size - 1
      idx += 1
      char = str[idx]
      next num << char if ('0'..'9').include?(char)
      result << (num.empty? ? char : char * num.to_i)
      num = ''
    end
    result
  end
end
