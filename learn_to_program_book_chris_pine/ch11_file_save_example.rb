# ch11_file_save_example.rb



filename = 'ListerQuote.txt'

test_string = 'I promise that I swear absolutely that I will never mention gazpacho soup again.'

File.open filename, 'w' do |f|        # the 'w' here is for write-access to the file, since we're trying to write to it
  f.write test_string
end

read_string = File.read filename
puts(read_string == test_string)