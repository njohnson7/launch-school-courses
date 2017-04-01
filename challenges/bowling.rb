# rules:
  # 10 frames total
    # 1-2 rolls per frame   (in first 9 frames)
    # roll(pins):  pins = num of pins knocked down during the roll
    # 10th frame!:
      # 2-3 rolls   (extra roll to determine score if strike or spare)
  # score():  return total score at end of game
    # open frame: 1..9 pins in 2 rolls    score = num pins
    # spare:      10 pins   in 2 rolls    score = 10 + num pins in next roll
    # strike:     10 pins   in _1_ roll   score = 10 + num pins in next _2_ rolls
    # 10th frame: total num of pins - 0..30
# algorithm:
  # [ [3,  4],                            [0, 0], ..., [0, 0] ]   # 7
  # [ [10, 0], [5,  3],                   [0, 0], ..., [0, 0] ]   # 26
  #         18        8
  # [ [5,  5], [3,  4],                   [0, 0], ..., [0, 0] ]   # 20
  #         13        7
  # [ [10, 0], [10, 0], [10, 0], [5,  3], [0, 0], ..., [0, 0] ]   # 81
  #         30       25       18        8
  #      10     10 + 10   10 + 10 + 10    8 + 8 + 5
  #     10, 10, 10, 5, 3, 0...0
  # [ [5,  5], [3,  7], [4,  1],          [0, 0], ..., [0, 0] ]   # 32
  #         13       14       5
  #     10      10 + 3       5 + 4             0
  #
  # get total of each frame, starting from last
    # increment sum by last.sum
    # if previous is [10, 0], increment sum by last.first(2).sum
    # if previous-previous is [10, 0], increment sum by last.first(1)
    # elsif previous is [5, 5], increment sum by last.first
    # if no previous, then done


def roll_n_times(rolls, pins)
  rolls.times do
    Array(pins).each { |value| @game.roll(value) }
  end
end
# roll_n_times(18, 0)
# roll_n_times(10, [3, 6])



class Game
  def initialize
    @frames = Array.new(10) { [] }
    @frame_num = 0
  end

  def score(sum = 0, idx = -1)
    raise RuntimeError unless @frame_num == 10

    current_frame = @frames[idx]
    return sum unless current_frame
    prev1 = @frames[idx - 1]
    prev2 = @frames[idx - 2]
    sum += current_frame.sum
    if prev1 == [10, 0]
      sum += current_frame.first(2).sum
      sum += current_frame.first if prev2 == [10, 0]
    elsif prev1&.sum == 10
      sum += current_frame.first
    end
    score(sum, idx - 1)
  end

  def roll(pins)
    raise RuntimeError if invalid?(pins)

    @frames[@frame_num] << pins

    if pins == 10
      if @frame_num == 9
        return if @frames[@frame_num].size < 3
        @frame_num += 1
      else
        @frames[@frame_num] << 0
        @frame_num += 1
      end
    else
      if @frame_num == 9
        if @frames[@frame_num].size < 3
          return if @frames[@frame_num].size == 1

          # GREATER THAN OR EQUAL TO 10!!!!:
          return if @frames[@frame_num].sum >= 10 && @frames[@frame_num].size == 2
          @frame_num += 1
        else
          @frame_num += 1
        end
      else
        raise RuntimeError if @frames[@frame_num].sum > 10
        @frame_num += 1 if @frames[@frame_num].size == 2
      end
    end
  end


  # def roll(pins)

  # end

  def invalid?(pins)
    !pins.between?(0, 10) || @frame_num > 9 ||
      (@frames[@frame_num].last != 10 && @frames[@frame_num].last.to_i + pins > 10)
  end

  # def score
  #   sum = 0
  #   @frames.reverse_each do |frame|
  #     sum +=
  #   end
  #   sum
  # end




 #  def score
 #    p @frames
 #    sum = 0
 #    @frames.flatten.each_with_index do |pins, idx|
 #      if pins == 10
 #        if @frames[idx + 1] == 0
 #          sum += 10 + @frames[idx + 1, 2].sum
 #        else
 #          sum += 10 + @frames[idx + 1]
 #        end
 #      end
 #    end
 #    sum
 #  end

 # # [ [10, 0], [10, 0], [10, 0], [5,  3], [0, 0], ..., [0, 0] ]   # 81
 #  #         30       25       18        8
 #  #     10, 10, 10, 5, 3, 0...0

 #  def score
 #    frames = @frames.flatten
 #    sum = 0
 #    idx = 0
 #    loop do
 #      # first, second, third = frames[idx, 3]
 #      current = frames.shift
 #      if current == 10 && frames.first == 0
 #        frames.shift
 #        if frames.first == 10 && frames[1] == 0
 #          frames.delete_at(1)
 #          sum += 10 + frames.first(2).sum
 #        end
 #      end
 #    end
 #    sum
 #  end
end
