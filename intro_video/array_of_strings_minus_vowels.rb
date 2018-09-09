# array_of_strings_minus_vowels.rb
# method that takes an array of strings, and returns an array of the same string vals, w/ vowels removed



def remove_vowels(array)
  array.map { |str| str.gsub(/[aeiou]/, '') }
end

strings = ['green', 'yellow', 'black', 'white']

no_vowels_ary = remove_vowels(strings)
no_vowels_str = ''

no_vowels_ary.each_with_index do |str, idx|
  no_vowels_str << "#{str}"
  idx == no_vowels_ary.length - 1 ? no_vowels_str << '' : no_vowels_str << ', '
end

puts "List of modified words are: #{no_vowels_str}"


# input: green, yellow, black, white
# output: grn, yllw, bck, wht