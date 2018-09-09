# easy7.rb


puts '---------1---------'

# 1.     Combine Two Lists
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']



puts
puts '---------2---------'

# 2.     Lettercase Counter
def letter_case_count(str)
  letter_case = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }
  letter_case.map { |type, pat| [type, str.count(pat)] }.to_h
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }



puts
puts '---------3---------'

# 3.     Capitalize Words
def word_cap(str)
  str.gsub(/\S+/) { |word| word.capitalize }
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'




puts
puts '---------4---------'

# 4.     Swap Case
def swapcase(str)
  str.tr('a-zA-Z', 'A-Za-z')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'




puts
puts '---------5---------'

# 5.     Staggered Caps (Part 1)
def staggered_case(str)
  str.gsub(/.{1,2}/) { |chunk| chunk.capitalize }
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'




puts
puts '---------6---------'

# 6.     Staggered Caps (Part 2)
def staggered_case(str)
  caps = false
  str.chars.map.with_index do |char, idx|
    caps = !caps if char[/[a-z]/i]
    caps ? char.upcase : char.downcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'




puts
puts '---------7---------'

# 7.     Multiplicative Average
def show_multiplicative_average(arr)
  result = arr.reduce(1, :*).fdiv(arr.size)
  puts "The result is #{format('%.3f', result)}"
end


show_multiplicative_average([3, 5]) # The result is 7.500

show_multiplicative_average([2, 5, 7, 11, 13, 17]) # The result is 28361.667


puts
puts '---------8---------'

# 8.     Multiply Lists
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |a, b| a * b }
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


puts
puts '---------9---------'

# 9.     Multiply All Pairs
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |a, b| a * b }.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]




puts
puts '---------10---------'

# 1.0    The End is Near But Not Here
def penultimate(str)
  str.split[-2]
end


p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


