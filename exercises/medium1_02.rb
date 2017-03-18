# medium1_02.rb

# class TextAnalyzer
#   def process
#     file = File.open('text.txt', 'r')
#     yield(file)
#     file.close
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |file| puts "#{file.read.split("\n\n").size} paragraphs" }
# analyzer.process { |file| puts "#{file.readlines.size } lines"}
# analyzer.process { |file| puts "#{file.read.scan(/\w+/).size} words" }



class TextAnalyzer
  def process
    file = File.open('text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.lines.size} lines"}
analyzer.process { |text| puts "#{text.scan(/\w+/).size} words" }
analyzer.process { |text| puts "#{text.split.size} words" }

# to_analyze = [%w[split("\n\n") paragraphs], %w[lines lines], %w[split words]]
# p (to_analyze.map do |meth, type|
#   # puts eval(%(analyzer.process { |text| "\#{text.#{meth}.size}"} \#{type}))
#   puts analyzer.process { |text| eval(%("\#{text.#{meth}.size}"} \#{type})) }
# end)
