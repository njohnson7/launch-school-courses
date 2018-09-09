# practice_each.rb
# Prints an array of names to screen using the each method



names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']

names.each { |name| puts name }
    # Calls the each method using the dot operator (.) on our array
        # This method loops thru each element in our array, in order, then begins executing
        #  the code w/i the block
            # The block's starting and ending points are defined by the curly braces {}
        # Each time we iterate over the array, we need to assign the value of the
        #  element to a variable
            # Above, we have named the variable 'name' and placed it in b/w 2 pipes ||
            # After that, we write the logic that we want to use to operate on the variable,
            #  which represents the current array element
                # In this case, simply printing it using puts


# my practice

array = [1, 2, 3, 4, 5]
array.each { |num| puts num + 10 }


# practice_each using do/end

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end
    # Added the counter x to add a number before each name, creating a numbered list output
        # number x is incremented every time we go thru the iteration