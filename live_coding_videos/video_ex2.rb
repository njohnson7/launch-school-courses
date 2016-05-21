# video_ex2.rb
# write prog that asks user to enter an int > 0, then asks if usr wants to
#  determine the sum or product of all nums b/w 1 and the entered int

def calc_sum(int)
  sum = 0
  (1..int).each { |n| sum += n }
  sum
end

def calc_product(int)
  prod = 1
  (1..int).each { |n| prod *= n }
  prod
end

puts 'Please enter an integer greater than 0:'
int = gets.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp.downcase

if choice == 's'
  puts "The sum of the integers between 1 and #{int} is #{calc_sum(int)}."
elsif choice == 'p'
  puts "The product of the integers between 1 and #{int} is" \
       " #{calc_product(int)}."
else
  puts 'Invalid choice.'
end
