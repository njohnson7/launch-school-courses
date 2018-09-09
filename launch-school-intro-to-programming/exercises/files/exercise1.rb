# exercise1.rb
# Takes one file's contents as input and creates a new transformed file as a result

# I did this exercise in irb, but this file is just for reference



simple = File.read("simple_file.txt")

original = File.new("original_file.txt", "w+")

File.open(original, "a") do |file|
  file.puts simple
end

File.read(original)