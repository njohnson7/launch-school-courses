# ch6_angry_boss.rb



puts "WHAT DO YOU WANT NOW???"
input = gets.chomp.upcase

puts "WHADDAYA MEAN \"#{input}\"?!? YOU'RE FIRED!!!"



# book answer:

names = ['johnson', 'smith', 'weinberg', 'filmore']

puts "CAN'T YOU SEE I'M BUSY?!  MAKE IT FAST, #{names[rand(4)].upcase}!"

request = gets.chomp

puts "WHADDAYA MEAN \"#{request.upcase}\"?!? YOU'RE FIRED!!"