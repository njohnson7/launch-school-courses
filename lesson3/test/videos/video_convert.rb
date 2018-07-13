Dir.mkdir('output') unless Dir.exist? 'output'

sizes = %w[320 480 640]

Dir['*.mp4'].each do |f|
  basename = File.basename f
  sizes.each do |size|
    puts "converting #{f} at #{size}x..."
    `ffmpeg -i #{f} -vf scale=#{size}:-1 output/#{basename}_#{size}.mp4 2>&1`
  end
end
