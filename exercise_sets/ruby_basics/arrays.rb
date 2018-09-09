# arrays.rb


# 1. New Pet
pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets.bsearch { |pet| pet == 'fish' }
puts "I have a pet #{my_pet}!"



# 2. More Than One
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets.last(2)
puts format('I have a pet %s and a pet %s!', *my_pets)

# Alternate solution:
pets = %w[cat dog fish lizard]
my_pets = pets.select { |pet| pet[/fish|lizard/] }.map { |pet| "a pet #{pet}"}
puts "I have #{my_pets.join(' and ')}!"



# 3. Free the Lizard
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
puts "I have a pet #{my_pets.first}!"
puts



# 4. One Isn't Enough
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets[1] = pets[1]
puts format('I have a pet %s and a pet %s!', *my_pets)
puts



# 5. What Color Are You?
colors = ['red', 'yellow', 'purple', 'green']
colors.each { |color| puts "I'm the color #{color}!" }
puts colors.map { |color| "I'm the color #{color}!"}
puts



# 6. Doubled
numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.map { |num| num * 2 }
p doubled_numbers



# 7. Divisible by Three
numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select { |n| n % 3 == 0 }
p divisible_by_three



# 8. Favorite Number (Part 1)
people = ['Dave', 7, 'Miranda', 3, 'Jason', 11]
dave, miranda, jason = people.each_slice(2).to_a
split_people = dave, miranda, jason
p split_people
puts



# 9. Favorite Number (Part 2)
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
flat_favorites = favorites.flatten
p flat_favorites



# 10. Are We The Same?
array1 = [1, 5, 9]
array2 = [1, 9, 5]
puts array1 == array2