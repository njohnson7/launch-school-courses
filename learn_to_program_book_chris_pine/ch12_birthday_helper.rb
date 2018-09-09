# ch12_birthday_helper.rb



birthdays_hash = {}
birthdays_ary = []

birthdays = File.read('birthdays.txt')
birthdays.each_line do |line|
  birthdays_ary << line.chomp
end

birthdays_ary.map! do |str|
  str.partition(',')
end

birthdays_ary.map do |ary|
  ary.delete(',')
  ary[1].lstrip!
end

birthdays_ary.each do |ary|
  birthdays_hash[ary[0]] = ary[1]
end

birthdays_hash.each do |k, v|
  birthdays_hash[k] = v.delete(",").split
end

birthdays_hash.each do |k, v|
  if v[0] == 'Jan'
    v[0] = 1
  elsif v[0] == 'Feb'
    v[0] = 2
  elsif v[0] == 'Mar'
    v[0] = 3
  elsif v[0] == 'Apr'
    v[0] = 4
  elsif v[0] == 'May'
    v[0] = 5
  elsif v[0] == 'Jun'
    v[0] = 6
  elsif v[0] == 'Jul'
    v[0] = 7
  elsif v[0] == 'Aug'
    v[0] = 8
  elsif v[0] == 'Sep'
    v[0] = 9
  elsif v[0] == 'Oct'
    v[0] = 10
  elsif v[0] == 'Nov'
    v[0] = 11
  elsif v[0] == 'Dec'
    v[0] = 12
  end
end

birthdays_hash.each do |k, v|
  year = v[2].to_i
  month = v[0]
  day = v[1].to_i
  birthdays_hash[k] = [year, month, day]
end

puts "Please enter a name."
name = gets.chomp
if birthdays_hash[name] == nil
  puts "Name not found."
else
  month = birthdays_hash[name][1]
  day = birthdays_hash[name][2]
  year = birthdays_hash[name][0]
  current_year = if Time.now - Time.new(2016, month, day) > 0
    2017
  else
    2016
  end
  next_birthday = Time.new(current_year, month, day)
  next_birthday_formatted = next_birthday.strftime("%B %-d, %Y")
  birth_date = Time.new(year, month, day)
  birth_year = birth_date.strftime("%Y").to_i
  age = (current_year - birth_year)
  puts "#{name}'s next birthday is #{next_birthday_formatted}, on which he will be #{age} years old."
end