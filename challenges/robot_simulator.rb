# A robot factory's test facility needs a program to verify robot movements.

# The robots have three possible movements:

#     turn right
#     turn left
#     advance

# Robots are placed on a hypothetical infinite grid, facing a particular
# direction (north, east, south, or west) at a set of {x,y} coordinates, e.g.,
# {3,8}, with coordinates increasing to the north and east.

# The robot then receives a number of instructions, at which point the testing
# facility verifies the robot's new position, and in which direction it is
# pointing.

#     The letter-string "RAALAL" means:
#         Turn right
#         Advance twice
#         Turn left
#         Advance once
#         Turn left yet again

# Say a robot starts at {7, 3} facing north. Then running this stream of
# instructions should leave it at {9, 4} facing west.

#       0 1 2 3 4 5 6 7 8 9  <= X
#    9  _ _ _ _ _ _ _ _ _ _
#    8  _ _ _ _ _ _ _ _ _ _
#    7  _ _ _ _ _ _ _ _ _ _
#    6  _ _ _ _ _ _ _ _ _ _
#    5  _ _ _ _ _ _ _ _ _ _
#    4  _ _ _ _ _ _ _ _ _ W                     W:[9, 4]
#    3  _ _ _ _ _ _ _ N _ _  N:[7, 3] => RAALAL ^
#    2  _ _ _ _ _ _ _ _ _ _
#    1  _ _ _ _ _ _ _ _ _ _
#    0  _ _ _ _ _ _ _ _ _ _

#    ^
#    Y

# x = west/east     west  -    east  +

# y = north/south   north +
#                   south -

# Rules:
  # grid is infinite
  # robot starts off facing a certain direction at a certain position
  # robot carries out instructions, contained in a letter string
    # instructions:  L => turn left, R => turn right, A => advance   (ex: RAALAL)
  # position and direction are then verified

Robot = Struct.new(:x, :y, :bearing) do
  DIRECTIONS = %i[north east south west]

  def orient(direction)
    DIRECTIONS.include?(direction) ? self.bearing = direction : raise(ArgumentError)
  end

  def turn_left
    turn(direction_num: -1)
  end

  def turn_right
    turn(direction_num: 1)
  end

  def turn(direction_num:)
    self.bearing = DIRECTIONS[(DIRECTIONS.index(bearing) + direction_num) % 4]
  end

  def at(*coordinates)
    self.x, self.y = coordinates
  end

  def coordinates
    [x, y]
  end

  def advance
    case bearing
    when :east  then self.x += 1
    when :west  then self.x -= 1
    when :north then self.y += 1
    when :south then self.y -= 1
    end
  end
end

class Simulator
  COMMANDS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

  def instructions(str)
    str.chars.map { |char| COMMANDS[char] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y) && robot.orient(direction)
  end

  def evaluate(robot, str)
    instructions(str).each { |command| robot.send(command) }
  end
end







# Robot = Struct.new(:x, :y, :bearing) do
#   DIRECTIONS = %i[north east south west]

#   def orient(direction)
#     raise ArgumentError unless DIRECTIONS.include?(direction)
#     self.bearing = direction
#   end

#   def turn_left
#     self.bearing = DIRECTIONS[DIRECTIONS.index(bearing) - 1]
#   end

#   def turn_right
#     self.bearing = DIRECTIONS[(DIRECTIONS.index(bearing) + 1) % 4]
#   end

#   def at(x, y)
#     self.x = x
#     self.y = y
#   end

#   def coordinates
#     [x, y]
#   end

#   def advance
#     case bearing
#     when :east  then self.x += 1
#     when :west  then self.x -= 1
#     when :north then self.y += 1
#     when :south then self.y -= 1
#     end
#   end
# end

# class Simulator
#   COMMANDS = { 'L' => :turn_left, 'R' => :turn_right, 'A' => :advance }

#   def instructions(str)
#     str.chars.map { |char| COMMANDS[char] }
#   end

#   def place(robot, x:, y:, direction:)
#     robot.at(x, y)
#     robot.orient(direction)
#   end

#   def evaluate(robot, str)
#     instructions(str).each { |command| robot.send(command) }
#   end
# end
