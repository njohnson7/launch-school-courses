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
  odd_idx = false
  space_just_added = false
  last_letter_idx = nil
  str.each_char do |char|
    if char == ' '
      if space_just_added
        next
      else
        result << ' '
        space_just_added = true
        last_space_idx = str.size
        odd_idx = !odd_idx
      end
    elsif char.match?(/[a-z]/i)
      if odd_idx
        result.insert(last_space_idx, char)
      else
        result << char
      end
      last_letter_idx = str.size - 1
      space_just_added = false
    elsif char == '.'
      break
    else
      raise TypeError, 'invalid input'
    end
  end
  last_letter_idx ? result[0..last_letter_idx] + '.' : result
end

p odd('whats the matter with kansas.') # whats eht matter htiw kansas.
p odd('whats the matter with kansas.   ') # whats eht matter htiw kansas.
p odd('whats the matter   with kansas.   ') # whats eht matter htiw kansas.
p odd('whats   the  matter   with kansas  .   ') # whats eht matter htiw kansas.
p odd('whats   the  matter   with  .') # whats eht matter htiw.
p odd('') # ''