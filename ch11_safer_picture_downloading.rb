# ch11_safer_picture_downloading.rb



Dir.chdir('/home/one/practice/new_pics')

pics = Dir['/home/one/practice/test_pics/**/*.{jpg,JPG}']

puts "What would you like to name this batch?"
batch_name = gets.chomp
puts

print "Downloading #{pics.length} files: "
pics.each_with_index do |name, idx|
  print "."
  num = idx + 1
  new_name = if pics.length < 10
    "#{batch_name}-0#{num}.jpg"
  else
    "#{batch_name}-#{num}.jpg"
  end
  if File.exist?(new_name)
    abort("\nERROR: #{new_name} already exists in #{Dir.pwd}!")
  else
    File.rename(name, new_name)
  end
end

puts 'DONE!'