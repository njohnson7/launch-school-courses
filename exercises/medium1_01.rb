# medium1_01.rb

# Privacy

# Consider the following class:

# Modify this class so both flip_switch and the setter method switch= are
# private methods.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
    # self.flip_switch(:off)  # DOESN'T WORK
    # self.switch = 'blue'    # WORKS
    # self.test               # DOESN'T WORK
  end

  def status
    switch
  end

  private

  attr_writer :switch
  attr_reader :switch

  # def test
  #   @test = 'test'
  # end

  # def switch=(desired_state)
  #   @switch = desired_state
  # end

  def flip_switch(desired_state)
    self.switch = desired_state   # WORKS
  end
end

machine = Machine.new
p machine
p machine.start
p machine
p machine.stop
# p machine.flip_switch(:on)
p machine
p machine.status
