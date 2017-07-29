
startle = -> { puts 'Yikes!' }  # => #<Proc:0x00000000d8a478@/home/one/launchschool/210/ruby_notes.rb:2 (lambda)>
surprise = startle              # => #<Proc:0x00000000d8a478@/home/one/launchschool/210/ruby_notes.rb:2 (lambda)>
surprise.()                     # => nil
surprise[]                      # => nil

take_two = proc { |a, b| p a, b }  # => #<Proc:0x00000000d89708@/home/one/launchschool/210/ruby_notes.rb:7>
take_two.()          # => [nil, nil]
take_two.(1)         # => [1, nil]
take_two.(1, 2, 10)  # => [1, 2]

# >> Yikes!
# >> Yikes!
# >> nil
# >> nil
# >> 1
# >> nil
# >> 1
# >> 2
