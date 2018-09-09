# ch14_procs_practice.rb


# a method that takes some obj and a proc, and will call the proc on that obj:
def do_until_false(first_input, some_proc)
  input = first_input
  output = first_input

  while output
    input = output
    output = some_proc.call(input)
  end

  input
end

build_array_of_squares = Proc.new do |array|
  last_number = array.last
  if last_number <= 0
    false
  else
    array.pop       # take off the last number...
    array.push(last_number ** 2)       # ...and replace it w/ its square...
    array.push(last_number - 1)       # ...followed by the next smaller number.
  end
end

always_false = Proc.new { |just_ignore_me| false }

puts do_until_false([5], build_array_of_squares).inspect
yum = 'lemonade with a hint of orange blossom water'
puts do_until_false(yum, always_false)
puts



# in this example, compose takes 2 procs and returns a new proc that, when called, calls the first proc and passes
#  its result into the 2nd:
def compose(proc1, proc2)
  Proc.new { |x| proc2.call(proc1.call(x)) }
end

square_it = Proc.new { |x| x ** 2 }
double_it = Proc.new { |x| x + x }

double_then_square = compose(double_it, square_it)
square_then_double = compose(square_it, double_it)

puts double_then_square.call(5)
puts square_then_double.call(5)
puts double_then_square.call(6)
puts square_then_double.call(6)