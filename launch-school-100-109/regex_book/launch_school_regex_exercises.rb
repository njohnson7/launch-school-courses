# launch_school_regex_exercises.rb


def url?(str)
  !!(str =~ /\Ahttps?:\/\/\S*\z/)
end

p url?('http://launchschool.com')   # -> true
p url?('https://example.com')       # -> true
p url?('https://example.com hello') # -> false
p url?('   https://example.com')    # -> false
puts



def fields(str)
  # str.split(/\W+/)
  str.split(/[ ,\t]+/)
end

p fields("Pete,201,Student") # -> ['Pete', '201', 'Student']
p fields("Pete \t 201    ,  TA") # -> ['Pete', '201', 'TA']
p fields("Pete \t 201") # -> ['Pete', '201'']
puts



def mystery_math(str)
  str.sub(/[+\-*\/]/, '?')
end

p mystery_math('4 + 3 - 5 = 2') # -> '4 ? 3 - 5 = 2'
p mystery_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 + 2) / 7 - 1 = 1'
puts



def mysterious_math(equation)
  equation.gsub(/[+\-*\/]/, '?')
end

p mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'
puts



def danish(str)
  str.sub(/\b(apple|(blueb|ch)erry)\b/, 'danish')
end

p danish('An apple a day keeps the doctor away')
    # -> 'An danish a day keeps the doctor away'
p danish('My favorite is blueberry pie') # -> 'My favorite is danish pie'
p danish('The cherry of my eye') # -> 'The danish of my eye'
p danish('apple. cherry. blueberry.') # -> 'danish. cherry. blueberry.'
p danish('I love pineapple') # -> 'I love pineapple'
puts



def format_date(date)
  date.sub(/\A(\d{4})-(\d{2})-(\d{2})\z/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)
puts


def format_date(date)
  date.sub(/\A(\d{4})([\-\/])(\d{2})\2(\d{2})\z/, '\4.\3.\1')
end

def format_date(date)
  date.sub(/\A(?<year>\d{4})(?<separator>[\-\/])(?<month>\d{2})\k<separator>(?<day>\d{2})\z/,
           '\k<day>.\k<month>.\k<year>')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change

/\$(?<dollars>\d+)\.(?<cents>\d+)/ =~ "$3.67" #=> 0
dollars #=> "3"