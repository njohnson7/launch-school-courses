# medium1_01.rb

class Device
  def initialize
    @recordings = []
  end

  def listen(&block)
    block && record(block.call)
  end

  def play
    puts recordings
  end

  private

  attr_reader :recordings

  def record(recording)
    recordings << recording
  end
end

listener = Device.new
p listener.listen { "Hello World!" }
p listener.listen
p listener.play # Outputs "Hello World!"
