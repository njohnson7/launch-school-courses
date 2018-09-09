# ch11_yaml_example.rb



require 'yaml'        # imports YAML into program so that we can use it

test_array = ['Give Quiche A Chance', 'Mutants Out!', 'Chameleonic Life-Forms, No Thanks',
              ['yo', 'yo', 'yo', ['wtf','bro'], ['crazy'], 'pants'],'42',42,true,'true']

test_string = test_array.to_yaml        # it's kind of like to_s, but it's a YAML description of test_array

filename = 'RimmerTShirts.txt'
File.open filename, 'w' do |f|
  f.write test_string
end

read_string = File.read filename

read_array = YAML::load read_string

puts(read_string == test_string)
puts(read_array == test_array)
puts

p test_array
p test_string
p read_string
p read_array
puts

puts test_array
puts test_string
puts read_string
puts read_array

# u can add newline chars to strings by just hitting Enter in ur code and continuing ur string on the next line
# but this doesn't work well w/ proper indentation:
puts "test
1
2
3"