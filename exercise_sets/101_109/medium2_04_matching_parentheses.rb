# medium2_04_matching_parentheses.rb
# Matching Parentheses?

# Write a method that takes a string as argument, and returns true if any
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

def balanced?(str)
  open_count = 0
  close_count = 0
  str.each_char do |c|
    open_count += 1 if c == '('
    close_count += 1 if c == ')'
    return false if close_count > open_count
  end
  open_count == close_count ? true : false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
puts


# Book solution:
def balanced?(str)
  parens = 0
  str.each_char do |c|
    parens += 1 if c == '('
    parens -= 1 if c == ')'
    break if parens < 0
  end
  parens.zero?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
puts


# There are a few other characters that should be matching as well. Square
# brackets and curly brackets normally come in pairs. Quotation marks(single and
# double) also typically come in pairs and should be balanced. Can you expand
# this method to take into account those characters.
def balanced?(str)
  # chars_to_match = { parens: %w(( )), square_brackets: %w([ ]),
  #                    curly_brackets: %w({ }),  }
  chars_to_match = [%w(( )), %w([ ]), %w({ })]
  chars_to_match.each do |set|
    count = 0
    str.each_char do |c|
      count += 1 if c == set.first
      count -= 1 if c == set.last
      return false if count < 0
    end
    return false unless count.zero?
  end
  str.gsub!(/(\w+)(')(\w+)/, '\1\3')
  (str.count("'").odd? || str.count('"').odd?) ? false : true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What [[is]]] up[') == false
p balanced?('What {{is}}} up{') == false
p balanced?('What (is) this?') == true
p balanced?('What [is] this?') == true
p balanced?('What {is} this?') == true
p balanced?('What "is" this?') == true
p balanced?('What "is" this?"') == false
p balanced?("What 'is' this?") == true
p balanced?("'What 'is' this?") == false
p balanced?(%('what [is] {this [i] dont even} "know"')) == true
p balanced?(%('what [is] {this [i] dont] even} "know"')) == false
p balanced?(%('what [is] {this [i] don't even} "know"')) == true
p balanced?(%('what [is] {this [i] don't] even} "know"')) == false
