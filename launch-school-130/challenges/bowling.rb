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

class Game
  def initialize
    @frames = Array.new(10) { [] }
    @frame_num = 0
  end

  def score(idx = -1)
    raise RuntimeError unless @frame_num == 10
    current_frame = @frames[idx]
    return 0 unless current_frame
    prev1_frame = @frames[idx - 1]
    prev2_frame = @frames[idx - 2]

    sum = current_frame.sum
    if prev1_frame == [10, 0]
      sum += current_frame.first(2).sum
      sum += current_frame.first if prev2_frame == [10, 0]
    elsif prev1_frame&.sum == 10
      sum += current_frame.first
    end

    sum + score(idx - 1)
  end

  def roll(pins)
    current_frame = @frames[@frame_num]
    raise RuntimeError if invalid?(pins, current_frame)
    current_frame << pins

    if @frame_num < 9
      current_frame << 0 if pins == 10
      @frame_num += 1 if current_frame.size == 2
    else
      roll_num = current_frame.size
      @frame_num += 1 if (roll_num == 2 && current_frame.sum < 10) || roll_num == 3
    end
  end

  def invalid?(pins, current_frame)
    last_pins = current_frame&.last.to_i
    !pins.between?(0, 10) || @frame_num > 9 ||
      (last_pins != 10 && last_pins + pins > 10)
  end
end




class Game
  def initialize
    @frames = Array.new(10) { [] }
    @frame_num = 0
  end

  def score(idx = -1)
    raise RuntimeError unless @frame_num == 10
    current_frame = @frames[idx]
    return 0 unless current_frame
    sum = current_frame.sum
    if @frames[idx - 1] == [10, 0]
      sum += current_frame.first(2).sum
      sum += current_frame.first if @frames[idx - 2] == [10, 0]
    elsif @frames[idx - 1]&.sum == 10
      sum += current_frame.first
    end
    sum + score(idx - 1)
  end

  def roll(pins)
    current_frame = @frames[@frame_num]
    raise RuntimeError if invalid?(pins, current_frame)
    current_frame << pins
    if @frame_num < 9
      current_frame << 0 if pins == 10
      @frame_num += 1 if current_frame.size == 2
    else
      roll_num = current_frame.size
      @frame_num += 1 if (roll_num == 2 && current_frame.sum < 10) || roll_num == 3
    end
  end

  def invalid?(pins, current_frame)
    !pins.between?(0, 10) || @frame_num > 9 ||
      (current_frame.last != 10 && current_frame&.last.to_i + pins > 10)
  end
end



  # def score(idx = -1)
  #   raise RuntimeError unless @frame_num == 10
  #   current_frame = @frames[idx]
  #   return 0 unless current_frame
  #   frame_score = calc_score(current_frame, @frames[idx - 1], @frames[idx - 2])
  #   frame_score + score(idx - 1)
  # end

  # def calc_score(current_frame, prev1_frame, prev2_frame)
  #   frame_score = current_frame.sum
  #   if prev1_frame == [10, 0]
  #     frame_score += current_frame.first(2).sum
  #     frame_score += current_frame.first if prev2_frame == [10, 0]
  #   elsif prev1_frame&.sum == 10
  #     frame_score += current_frame.first
  #   end
  #   frame_score
  # end