# proc_example.rb



talk = Proc.new do
  puts "I am talking."
end

talk.call



# Procs can also take arguments if specified

talk = Proc.new do |name|
  puts "I am talking to #{name}."
end

talk.call "Bob"
# Or:
talk.call("Bob")