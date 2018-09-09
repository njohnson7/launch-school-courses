# easy2_08.rb
# Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, idx|
  if name.start_with?('Be')
    puts idx
    break
  end
end

puts flintstones.index { |name| name.start_with?('Be') }

puts flintstones.find_index { |name| name.start_with?('Be') }

puts flintstones.index { |name| name[0, 2] == 'Be' }

puts flintstones.index { |name| name =~ /^Be/ }
