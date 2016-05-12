# fizzbuzz.rb



def fizzbuzz(start_num, end_num)
  numbers = (start_num..end_num).to_a
  numbers.each do |n|
    output = ''
    output << 'Fizz' if n % 3 == 0
    output << 'Buzz' if n % 5 == 0
    output = n if output.empty?
    print "#{output.inspect}"
    print numbers.index(n) == numbers.length - 1 ? "\n" : ", "
  end
end

fizzbuzz(1, 15)