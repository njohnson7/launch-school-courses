def event(description, &block)
  @events << { description: description, condition: block }
end

def setup(&block)
  @setup << block
end

@events = []
@setup = []

load 'events.rb'

@events.each do |event|
  @setup.each(&:call)
  puts "ALERT: #{event[:description]}" if event[:condition].call
end



# setup do
#   puts "Setting up sky"
#   @sky_height = 100
# end
# setup do
#   puts "Setting up mountains"
#   @mountains_height = 200
# end
# event "the sky is falling" do
#   @sky_height < 300
# end
# event "it's getting closer" do
#   @sky_height < @mountains_height
# end
# event "whoops... too late" do
#   @sky_height < 0
# end

#  expect this output:

# <= Setting up sky
#    Setting up mountains
#    ALERT: the sky is falling
#    Setting up sky
#    Setting up mountains
#    ALERT: it's getting closer
#    Setting up sky
#    Setting up mountains

lambda {
  setups = []
  events = []
  Kernel.send :define_method, :setup do |&block|
    setups << block
  end
  Kernel.send :define_method, :event do |description, &block|
    events << {:description => description, :condition => block}
  end
  Kernel.send :define_method, :each_setup do |&block|
    setups.each do |setup|
      block.call setup
    end
  end
  Kernel.send :define_method, :each_event do |&block|
    events.each do |event|
      block.call event
    end
  end
}.call
load 'events.rb'
each_event do |event|
  each_setup do |setup|
    setup.call
  end
  puts "ALERT: #{event[:description]}" if event[:condition].call
end




each_event do |event|
  env = Object.new
  each_setup do |setup|
    env.instance_eval &setup
  end
  puts "ALERT: #{event[:description]}" if env.instance_eval &(event[:condition])
end
