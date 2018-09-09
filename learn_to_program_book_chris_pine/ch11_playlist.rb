# ch11_playlist.rb



Dir.chdir('/home/one/practice')

music = Dir['/home/one/practice/music_practice/**/*.mp3']

playlist = File.new("playlist.m3u", "w")

File.open(playlist, "w") do |file|
  file.puts music.shuffle
end