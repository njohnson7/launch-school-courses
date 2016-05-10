# ch11_photos_practice.rb



Dir.chdir 'C:/Documents and Settings/Katy/PictureInbox'

# first, we find all the pics to be moved
pic_names = Dir['F:/**/*.jpg']

puts 'What would you like to call this batch?'
batch_name = gets.chomp
puts

print "Downloading #{pic_names.length} files: "
# this will be our counter, starting from 1 (can also start from 0):
pic_number = 1
pic_names.each do |name|
  print '.'       # this is our progress bar
  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end
# this renames the pic, but since 'name' has a big long path on it, and 'new_name' doesn't, it also moves the file to the
#  current working dir, which is now Katy's PictureInbox folder.
# Since it's a *move*, this effectively downloads and deletes the originals.
# And since this is a memory card, not a hard drive, each of these takes a second or so; hence the little dots let her
#  know that the program didn't hose her machine.
File.rename name, new_name
pic_number += 1
end

puts
puts 'Done!'