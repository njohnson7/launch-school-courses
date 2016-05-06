# ch9_improved_ask_method.rb



def ask question
  while true
    puts question
    answer = gets.chomp.downcase
    if answer == 'yes'
      return true
    elsif answer == 'no'
      return false
    else
      puts "You must answer 'yes' or 'no'."
    end
  end
end

puts "<briefing>"
ask "Do you like tacos?"
ask "Do you like burritos?"
wets_bed = ask "Do you wet the bed?"
ask "Do you like chimichangas?"
ask "Do you like taquitos?"
puts "<debriefing>"

if wets_bed
  puts "you wet the bed."
else
  puts "you don't wet the bed."
end