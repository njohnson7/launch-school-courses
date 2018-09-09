# perform_again_dowhile.rb
    # asks if the user wants to perform an action again, but keep prompting if the user
    # enters 'Y'



loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  else
  end
end

# this is a classic use case for a do/while loop because we want to repeatedly perform
# an action based on some condition, but we want the action to be executed at least
# 1 time no matter what

# this is a simple loop, except the condition to break out of the loop occurs at the end,
# therefore ensuring that the loop executes at least once



# there's another construct in ruby that supports do/while loops, but it's not recommended:

begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'