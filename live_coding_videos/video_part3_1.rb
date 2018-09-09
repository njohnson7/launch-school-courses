# video_part3_1.rb
# return a value of phrase in english

WORDS_VALUES = {
  'zero' => 0,
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
  'ten' => 10,
  'plus' => '+',
  'minus' => '-',
  'times' => '*',
  'divided' => '/'
}.freeze

def computer(english)
  words = english.split(' ')
  words.delete('by')

  words.each do |word|
    word.gsub!(word, WORDS_VALUES[word].to_s) if WORDS_VALUES.key?(word)
  end

  eval(words.join(' '))
end

p computer('two plus two')      #=> 4
p computer('seven minus six')   #=> 1
p computer('zero plus 8')       #=> 8
p computer('ten minus 5')
p computer('4 plus three')
p computer('six plus nine')
p computer('1 minus eight')
puts

p computer('two plus two minus three') #=> 1
p computer('three minus one plus five minus 4 plus six plus 10 minus 4') #=> 15
p computer('five plus four minus 3 plus 2 plus ten minus six')
puts

p computer('eight times four plus six divided by two minus two') #=> 33
p computer('one plus four times two minus two') #=> 7
p computer('nine divided by three times six') #=> 18
p computer('seven plus four divided by two') #=> 9
p computer('seven times four plus one divided by three minus two') #=> 26
p computer('one plus four times three divided by two minus two') #=> 5
p computer('nine divided by three times six') #=> 18
p computer('five times four plus two divided by two minus six times three
             divided by two plus ten divided by three times four minus one')
p computer('9 + 2 - 6 * 3 + 4 * 8 - 2 * 4 / 3 + 1 * ten - two / 3 + 1')
puts


def alternate(english)
  words = english.split(' ')
  words.delete('by')

  words.each do |word|
    word.gsub!(word, WORDS_VALUES[word].to_s) if WORDS_VALUES.key?(word)
  end

  loop do
    break unless words.include?('+') || words.include?('-') ||
                 words.include?('*') || words.include?('/')
    num1 = words.shift.to_i
    operator = words.shift
    num2 = words.shift.to_i
    result = case operator
             when '+' then num1 + num2
             when '-' then num1 - num2
             when '*' then num1 * num2
             when '/' then num1 / num2
             end
    words.unshift(result)
  end

  words.first
end

p alternate('two plus two minus three') #=> 1
p alternate('three minus one plus five minus 4 plus six plus 10 minus 4') #=> 15
p alternate('five plus four minus 3 plus 2 plus ten minus six')
puts

p alternate('eight times four plus six divided by two minus two') #=> 17, not 33
p alternate('one plus four times two minus two') #=> 8, not 7
p alternate('nine divided by three times six') #=> 18
puts

def alternate2(english)
  words = english.split(' ')
  words.delete('by')

  words.each do |word|
    word.gsub!(word, WORDS_VALUES[word].to_s) if WORDS_VALUES.key?(word)
  end

  loop do
    break unless words.include?('*') || words.include?('/')

    idx_times = words.index('*') || 100
    idx_divide = words.index('/') || 100
    operator_idx = idx_times < idx_divide ? idx_times : idx_divide

    num1 = words.delete_at(operator_idx - 1).to_i
    operator = words.delete_at(operator_idx - 1)
    num2 = words.delete_at(operator_idx - 1).to_i
    result = case operator
             when '*' then num1 * num2
             when '/' then num1 / num2
             end

    words.insert((operator_idx - 1), result)
  end

  loop do
    break unless words.include?('+') || words.include?('-')

    num1 = words.shift.to_i
    operator = words.shift
    num2 = words.shift.to_i
    result = case operator
             when '+' then num1 + num2
             when '-' then num1 - num2
             end

    words.unshift(result)
  end

  words.first
end

p alternate2('eight times four plus six divided by two minus two') #=> 33
p alternate2('one plus four times two minus two') #=> 7
p alternate2('nine divided by three times six') #=> 18
p alternate2('seven plus four divided by two') #=> 9
p alternate2('seven times four plus one divided by three minus two') #=> 26
p alternate2('one plus four times three divided by two minus two') #=> 5
p alternate2('nine divided by three times six') #=> 18
p alternate2('five times four plus two divided by two minus six times three
             divided by two plus ten divided by three times four minus one')
p alternate2('9 + 2 - 6 * 3 + 4 * 8 - 2 * 4 / 3 + 1 * ten - two / 3 + 1')
