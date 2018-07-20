# ex2 - weather forecast

def predict_weather
  sunshine = [true, false].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

def predict_weather
  puts "Today's weather will be #{%w[sunny cloudy].sample}!"
end

# predict_weather
# predict_weather
# predict_weather
# predict_weather



#---- ex4: pets ----#
pets = { cat: 'fluffy', dog: %w[sparky fido], fish: 'oscar' }
pets[:dog] << 'bowser'
# p pets


#---- ex5: even numbers ----#
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

# p even_numbers # expected output: [2, 6, 8]

# p numbers.select &:even?



#---- ex6: confucius says ----#
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

def get_quote(person)
  { 
    Yoda:      'Do. Or do not. There is no try.',
    Confucius: 'I hear and I forget. I see and I remember. I do and I understand.',
    Einstein:  'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.' 
  }[person.to_sym]
end


# puts 'Confucius says:'
# puts '"' + get_quote('Confucius') + '"'
# puts '"' + get_quote('Einstein') + '"'
# puts '"' + get_quote('Yoda') + '"'





#---- ex7: account balance ----#
# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

# puts balance

# p [january, february, march].sum 0, &method(:calculate_balance)






#---- ex8: colorful things ----#
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i >= colors.length || i >= things.length

  if i == 0
   # puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
   # puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

colors.zip(things).each_with_index do |(color, thing), idx| 
  # puts "#{idx.zero? ? 'I have' : 'And'} a #{color} #{thing || 'thing'}."
end




#---- ex9: digit product ----#
def digit_product(str_num)
  digits  = str_num.chars.map { |n| n.to_i }
  product = 1

  digits.each do |digit|
    product *= digit
  end

  product
end



def digit_product str_num
  eval str_num.gsub /(?<=.)(?=.)/, '*'
end

# p digit_product('12345')
# p digit_product('1')
# p digit_product('12')
# p digit_product('158')
# expected return value: 120
# actual return value: 0




#---- ex10: warriors and wizards ----#
# Each player starts with the same basic stats.
player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.
character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym

player.merge!(character_classes[input])

puts 'Your character stats:'
puts player


