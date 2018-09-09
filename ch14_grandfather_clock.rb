# ch14_grandfather_clock.rb



def clock(&block)
  hours = Time.new.hour
  hours -= 12 if hours >= 13
  hours = 12 if hours == 0
  hours.times { block[] }
end

chime = Proc.new { puts 'DONGERINO!' }

clock { puts 'DONG!' }
clock(&chime)