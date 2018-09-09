# ch10_99_bottles_refactored.rb



def english_number(number)
  return "You can't enter a negative number!" if number < 0
  return "zero" if number == 0

  num_string = ''
  ones_place = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tens_place = ['ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']
  teenagers =  ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  left = number       # left = how much of the number we still have left to write out

  write = left / 1_000_000_000
  left -= write * 1_000_000_000
  if write > 0
    billions = english_number(write)
    num_string += billions + ' billion'
    num_string += ' ' if left > 0
  end

  write = left / 1_000_000
  left -= write * 1_000_000
  if write > 0
    millions = english_number(write)
    num_string += millions + ' million'
    num_string += ' ' if left > 0
  end

  write = left / 1000
  left -= write * 1000
  if write > 0
    thousands = english_number(write)
    num_string += thousands + ' thousand'
    num_string += ' ' if left > 0
  end

  write = left / 100        # write = part we are writing out now - how many hundreds left?
  left -= write * 100       # subtract off the hundreds
  if write > 0
    hundreds = english_number(write)        # recursion
    num_string += hundreds + ' hundred'
    num_string += ' ' if left > 0       # so we don't write 'two hundredfifty-one'
  end

  write = left / 10       # how many tens left?
  left -= write * 10       # subtract off the tens
  if write > 0
    if ( (write == 1) and (left > 0) )      # since we can't write tenty-two instead of twelve, have to make special exception
      num_string += teenagers[left - 1]
      left = 0        # since we already took care of the digit in the ones place, we have nothing left to write
    else
      num_string += tens_place[write - 1]
    end
    num_string += '-' if left > 0       # so we don't write out 'sixtyfour'
  end

  write = left        # how many ones left to write out?
  left = 0        # subtract off the ones
  num_string += ones_place[write - 1] if write > 0
  num_string
end

puts "How many bottles of beer?"
num_at_start = gets.chomp.to_i

num_bot = proc { |n| "#{english_number(n)} bottle#{n == 1 ? '' : 's'}" }
num_at_start.downto(2) do |num|
  puts "#{num_bot[num].capitalize} of beer on the wall, #{num_bot[num]} of beer!"
  puts "Take one down and pass it around, #{num_bot[num - 1]} of beer on the wall!"
end

puts "#{num_bot[1].capitalize} of beer on the wall, #{num_bot[1]} of beer!"
puts "Take one down and pass it around, no more bottles of beer on the wall!"
puts "No more bottles of beer on the wall, no more bottles of beer!"
puts "Go to the store and buy some more, #{num_bot[num_at_start]} of beer on the wall!"