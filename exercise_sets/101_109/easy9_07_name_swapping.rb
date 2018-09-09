# easy9_07_name_swapping.rb
# Name Swapping

# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the last name.

def swap_name(name)
  "#{name.split.last}, #{name.split.first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
p swap_name('Bob Loblaw')
puts


# Book solution:
def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
p swap_name('Bob Loblaw')
