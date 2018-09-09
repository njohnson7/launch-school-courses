# Implement the classic method for composing secret messages called a square
# code.

# The input is first normalized: The spaces and punctuation are removed from the
# English text and the message is down-cased.

# Then, the normalized characters are broken into rows. These rows can be
# regarded as forming a rectangle when printed with intervening newlines.

# For example, the sentence

#     If man was meant to stay on the ground god would have given us roots

# is 54 characters long.

# Broken into 8-character columns, it yields 7 rows.

# Those 7 rows produce this rectangle when printed one per line:

# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# sroots

# The coded message is obtained by reading down the columns going left to right.
# For example, the message above is coded as:

# imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau

# Write a program that, given an English text, outputs the encoded version of
# that text.

# The size of the square (number of columns) should be decided by the length of
# the message. If the message is a length that creates a perfect square (e.g. 4,
# 9, 16, 25, 36, etc), use that number of columns. If the message doesn't fit
# neatly into a square, choose the number of columns that corresponds to the
# smallest square that is larger than the number of characters in the message.

# For example, a message 4 characters long should use a 2 x 2 square. A message
# that is 81 characters long would use a square that is 9 columns wide. A
# message between 5 and 8 characters long should use a rectangle 3 characters
# wide.

# Output the encoded text grouped by column.


# normalize input: spaces/punctuation removed, and msg is downcased
# then the normalized chars are broken into rows
  # these rows form a rectangle when printed w/ intervening lines
# msg size = num of chars after normalizing

# ex: 'If man was meant to stay on the ground god would have given us roots'
  # 54 chars in size -> 8 char columns, 7 rows
    #   ifmanwas
    #   meanttos
    #   tayonthe
    #   groundgo
    #   dwouldha
    #   vegivenu
    #   sroots
# coded msg -> read down the columns going from left to right
  # ex: 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau'
# size of the square (num of columns) determioned by msg size
  # if msg size is a perfect square, use that num of columns
  # else, num columns = smallest square > msg size
    # ex: 4 -> 2,   25 -> 5,   54 -> 8,   27 -> 6

# normalize_plaintext: spaces/punctuation removed, and msg is downcased
# size: num of columns
# plaintext_segments: text split up into rows (Array of Strings) the size of column
  # last row may be shorter
# ciphertext: encode text, grouped by column and join w/o spaces
# normalize_ciphertext: add spaces in b/w each column


# class Crypto
#   attr_reader :text, :size, :plaintext_segments

#   alias normalize_plaintext text

#   def initialize(str)
#     @text = str.downcase.delete('^a-z0-9')
#     @size = Math.sqrt(text.size).ceil
#     @plaintext_segments = text.scan(/.{1,#{size}}/)
#     @cipher_segments = cipher_segments
#   end

#   def ciphertext
#     @cipher_segments.join
#   end

#   def normalize_ciphertext
#     @cipher_segments.join(' ')
#   end

#   def cipher_segments
#     plaintext_segments
#       .map(&:chars).tap { |segs| return segs.first.zip(*segs.drop(1)).map(&:join) }
#   end
# end






# class Crypto
#   attr_reader :normalize_plaintext, :size, :plaintext_segments,
#               :ciphertext, :normalize_ciphertext

#   def initialize(str)
#     @normalize_plaintext = str.downcase.delete('^a-z0-9')
#     @size = Math.sqrt(normalize_plaintext.size).ceil
#     @plaintext_segments = normalize_plaintext.scan(/.{1,#{size}}/)
#     @normalize_ciphertext = encrypt_text
#     @ciphertext = normalize_ciphertext.delete(' ')
#   end

#   def encrypt_text
#     plaintext_segments
#       .map(&:chars).tap { |s| return s.first.zip(*s.drop(1)).map(&:join).join(' ') }
#   end
# end





attrs = %i[normalize_plaintext size plaintext_segments ciphertext normalize_ciphertext]
Crypto = Struct.new(*attrs) do
  def initialize(str)
    self.normalize_plaintext = str.downcase.delete('^a-z0-9')
    self.size = Math.sqrt(normalize_plaintext.size).ceil
    self.plaintext_segments = normalize_plaintext.scan(/.{1,#{size}}/)
    self.normalize_ciphertext = encrypt_text
    self.ciphertext = normalize_ciphertext.delete(' ')
  end

  def encrypt_text
    plaintext_segments
      .map(&:chars).tap { |s| return s.first.zip(*s.drop(1)).map(&:join).join(' ') }
  end
end







def crypto(str)
  text = str.downcase.delete('^a-z0-9')
  text << ' ' until (text.size)**0.5 % 1 == 0
  text.scan(/.{1,#{((text.size)**0.5).to_i}}/)
      .map(&:chars).transpose.map { |x| x.join.delete(' ') }.join(' ')
end

p crypto('If man was meant to stay on the ground god would have given us roots') ==
'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau'
# Crypto = Struct.new(:text) do

# end