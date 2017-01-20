# easy3.rb



# 1.   Searching 101
def searching
  nums = %w[1st 2nd 3rd 4th 5th last].map do |pos|
    puts "==> Enter the #{pos} number:"
    gets.to_i
  end
  last = nums.pop
  appears_msg = nums.include?(last) ? 'appears' : 'does not appear'
  puts "The number #{last} #{appears_msg} in #{nums.inspect}."
end

# searching



# 2.   Arithmetic Integer
def arithmetic
  n1, n2 = %w[first second].map do |pos|
    puts "==> Enter the #{pos} number:"
    gets.to_i
  end
  %w[+ - * / % **].each do |op|
    eq = "#{n1} #{op} #{n2}"
    puts "==> #{eq} = #{eval(eq)}"
  end
end

# arithmetic



# 3.   Counting the Number of Characters
def num_chars
  print "Please write word or multiple words: "
  str = gets.chomp
  count = str.count('^ ')
  puts %(There are #{count} characters in "#{str}".)
end

# num_chars



# 4.   Multiplying Two Numbers
def multiply(n1, n2)
  n1 * n2
end

p multiply(5, 3) == 15
puts



# 5.   Squaring an Argument
def square(n)
  multiply(n, n)
end

p square(5) == 25
p square(-8) == 64
puts



# 6.   Exclusive Or
def xor?(bool1, bool2)
  bool1 ^ bool2
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
puts



# 7.   Odd Lists
def oddities(arr)
  arr.select.with_index { |_, idx| idx.even? }
end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
puts



# 8.   Palindromic Strings (Part 1)
def palindrome?(str)
  str == str.reverse
end


p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
puts '----------'
puts



# 9.   Palindromic Strings (Part 2)
def real_palindrome?(str)
  str = str.downcase.gsub(/[^a-z0-9]/, '')
  palindrome?(str)
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
puts



# 1.0  Palindromic Numbers
def palindromic_number?(num)
  palindrome?(num.to_s)
end


p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
