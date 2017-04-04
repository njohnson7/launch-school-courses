# input: String
  # valid: letters, spaces, and a period
  # 1 or more words separated by 1+ spaces
    # words: 1-20 letters
  # terminated by 0+ spaces and period
# output:
  # words separated by a single space, ending w/ a period after last word
  # odd indexed words are reversed, even are kept the same
# rules:
  # characters must be read and printed one at a time
# algorithm:
  # iterate over chars of str
    # keep track of idx by considering spaces
    # add chars of each word to a string
      # even idx: <<
      # odd idx: save str.size to var, and insert letters at that position
    # append a single space to string in b/w words
    # append a period when done


def odd(str)
  result = ''
  is_odd_idx = false
  space_just_added = false
  last_letter_idx = nil
  last_space_idx = nil
  str.each_char do |char|
    if char == ' '
      next if space_just_added
      result << ' '
      space_just_added = true
      last_space_idx = result.size
      is_odd_idx = !is_odd_idx
    elsif char.match?(/[a-z]/i)
      is_odd_idx ? result.insert(last_space_idx, char) : result << char
      last_letter_idx = result.size - 1
      raise ArgumentError if last_letter_idx - last_space_idx.to_i >= 20
      space_just_added = false
    elsif char == '.'
      break
    else
      raise ArgumentError, 'invalid input'
    end
  end
  last_letter_idx ? result[0..last_letter_idx] + '.' : result
end

def odd(str)
  result = ''
  is_odd_idx = false
  space_just_added = false
  last_letter_idx = 0
  last_space_idx = 0
  str.each_char do |char|
    case char
    when ' '
      next if space_just_added
      result << ' '
      space_just_added = true
      last_space_idx = last_letter_idx + 1
      is_odd_idx = !is_odd_idx
    when 'a'..'z', 'A'..'Z'
      next if last_letter_idx - last_space_idx >= 20
      is_odd_idx ? result.insert(last_space_idx, char) : result << char
      last_letter_idx = last_space_idx if last_letter_idx < last_space_idx
      last_letter_idx += 1
      space_just_added = false
    when '.'
      break
    else
      raise ArgumentError, "'#{char}' is not a valid character"
    end
  end
  last_letter_idx.nonzero? ? result[0...last_letter_idx] + '.' : result
end

# def odd(str)
#   return '' if str.empty?
#   odd_idx = true
#   str.delete('.').strip.squeeze(' ').gsub(/[a-z]{1,20}/i) do |word|
#     odd_idx = !odd_idx
#     odd_idx ? word.reverse : word
#   end
# end

# def odd(str)
#   new_str = str.split(/\s+|\./)
#                .map.with_index { |w, i| i.odd? ? w.reverse : w }
#                .join(' ')
#   "#{new_str}#{'.' if str.include?('.')}"
# end

def odd(str)
  return '' if str.empty?
  str.delete('.').squeeze(' ').strip.gsub(/(\w+) (\w+)/) { "#{$1} #{$2.reverse}" } + '.'
end


OddWords = Struct.new(:str) do
  def reverse_odds
    # raise ArgumentError unless str[/([a-z]{1,20}( )+?)+\.\z/i]
    return '' if str.empty?
    str.delete('.').squeeze(' ').strip.gsub(/(\w+) (\w+)/) { "#{$1} #{$2.reverse}" } + '.'
  end
end


# p odd('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
# p odd('whats the matter with kansas.   ') == 'whats eht matter htiw kansas.'
# p odd('whats the matter   with kansas.   ') == 'whats eht matter htiw kansas.'
# p odd('whats   the  matter   with kansas  .   ') == 'whats eht matter htiw kansas.'
# p odd('whats   the  matter   with  .') == 'whats eht matter htiw.'
# p odd('whats the matter with kansas yo.') == "whats eht matter htiw kansas oy."
# p odd('whats    the   matter with      kansas  yo.  ') == "whats eht matter htiw kansas oy."
# p odd('hello.')               == 'hello.'
# p odd('hello .')              == 'hello.'
# p odd('hello world.')         == 'hello dlrow.'
# p odd('hello world .')        == 'hello dlrow.'
# p odd('hello  world .')       == 'hello dlrow.'
# p odd('hello  hello world.')  == 'hello olleh world.'
# p odd('') == ''
# p odd('one two abcdefghijklmnopqrst abcdefghijklmnopqrs') # 19
# p odd('one two abcdefghijklmnopqrst abcdefghijklmnopqrst') # 20
# p odd('one two abcdefghijklmnopqrst abcdefghijklmnopqrstu') # 21
# p odd('one two abcdefghijklmnopqrst abcdefghijklmnopqrstuv') # 22
# p odd('one two abcdefghijklmnopqrstuv asdasd ') # 22
