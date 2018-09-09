file = Dir.glob('/media/one/blue/Downloads/*').select { |f| File.file? f }.max_by { |f| f.size }
puts "The largest file in /media/one/blue/Downloads is #{File.basename file} and its size is #{File.size file} bytes."
