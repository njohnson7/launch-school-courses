# exception_example.rb


# syntax:

# begin/rescue/end block:
begin
  # perform some dangerous operation
rescue
  # do this if operation fails
  # for example, log the error
end



# example w/ actual code:

names = ['bob', 'joe', 'steve', nil, 'frank']       # nil value is in array

names.each do |name|
  # uses begin/rescue/end block to handle any exceptions that may happen w/i our block
  begin
    puts "#{name}'s name has #{name.length} letters in it."       # calling .length on nil gives an error
  # when an exception, or error, is raised, rescue block will execute, and then the program will continue to run as it normally would.
  # if we didn't have rescue block, program would stop once it hit the exception, and we would lose the rest of our print-out
  rescue
    puts "Something went wrong!"
  end
end