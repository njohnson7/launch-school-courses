# ch10_recursion_practice.rb



def ask_recursively(question)
  puts question
  reply = gets.chomp.downcase
  if reply == 'yes'
    true
  elsif reply == 'no'
    false
  else
    puts 'Please answer "yes" or "no".'
    ask_recursively(question)               # method calls itself recursively
  end
end

ask_recursively("Do you like fish?")