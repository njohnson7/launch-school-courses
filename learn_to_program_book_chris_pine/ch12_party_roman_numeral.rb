# ch12_party_roman_numeral.rb



def roman_to_integer(roman)
  roman.downcase!
  roman.sub!('ix', 'viv')
  roman.sub!('iv', 'iiii')
  roman.sub!('xc', 'lxl')
  roman.sub!('xl', 'xxxx')
  roman.sub!('cm', 'dcd')
  roman.sub!('cd', 'cccc')

  roman_ary = roman.split('')
  romans = { m: 0, d: 0, c: 0, l: 0, x: 0, v: 0, i: 0 }
  integer = ''
  error = "ERROR: Not a valid Roman Numeral."

  roman_ary.each do |letter|
    if letter == 'm'
      romans[:m] += 1
    elsif letter == 'd'
      romans[:c] += 5
    elsif letter == 'c'
      romans[:c] += 1
    elsif letter == 'l'
      romans[:x] += 5
    elsif letter == 'x'
      romans[:x] += 1
    elsif letter == 'v'
      romans[:i] += 5
    elsif letter == 'i'
      romans[:i] += 1
    else
      return error
    end
  end

  if romans[:m] > 3
    return "ERROR: Number must be 3000 or less."
  else
    integer << romans[:m].to_s
  end

  if romans[:c] > 9
    return error
  else
    integer << romans[:c].to_s
  end

  if romans[:x] > 9
    return error
  else
    integer << romans[:x].to_s
  end

  if romans[:i] > 9
    return error
  else
    integer << romans[:i].to_s
  end

  "Party like it's #{integer}!"
end

puts "Please enter a roman numeral between I and MMM."
roman = gets.chomp

puts roman_to_integer(roman)