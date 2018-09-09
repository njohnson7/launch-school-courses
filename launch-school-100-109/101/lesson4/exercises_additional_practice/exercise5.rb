# exercise5.rb

# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name.start_with?('Be') }


# solution 2:
p flintstones.index { |name| name[/^Be/] }
