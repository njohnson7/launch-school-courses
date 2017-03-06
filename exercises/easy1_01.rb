# easy1_01.rb


# Banner Class

# Behold this incomplete class for constructing boxed banners.

# class Banner
#   def initialize(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#   end

#   def empty_line
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# Complete this class so that the test cases shown below work as intended. You
# are free to add any methods or instance variables you need. However, do not
# make the implementation details public.

# You may assume that the input will always fit in your terminal window.



class Banner
  def initialize(message, width = message.size + 2)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :width

  def horizontal_rule
    "+#{'-' * width}+"
  end

  def empty_line
    "|#{' ' * width}|"
  end

  def message_line
    '|' + message[0, width - 2].center(width) + '|'
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+
puts

banner = Banner.new('taco', 50)
puts banner
banner = Banner.new('tacoa jawdiawodiawdj awidj oawdjiaw dj', 10)
puts banner
