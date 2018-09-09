Dir.mkdir('output') unless Dir.exist? 'output'

# sizes = %w[320 480 640]
sizes = %w[320]

errors = []

Dir['*.mp4'].each do |f|
  basename = File.basename f
  sizes.each do |size|
    puts "converting #{f} at #{size}x..."
    result = `ffmpeg -i #{f} -vf scale=#{size}:-1 output/#{basename}_#{size}.mp4 2>&1`
    errors << result unless $?.success?
  end
end

# p errors

unless errors.empty?
  puts
  puts 'Completed with errors:'
  puts errors.join("\n\n")
end
