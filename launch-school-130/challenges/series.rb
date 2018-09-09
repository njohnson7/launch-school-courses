# input: String of digits, num of digits to include in each slice
  # initialize(num_str)
  # slices(slice_size)
# output: Array containing all possible consecutive digits series of slice size
# rules:
  # raise ArgumentError if n > num of digits in input
# algorithm:
  # turn num_str into digits
  # check if slice_size is valid
  # get each consectuive slice_size of digits

class Series
  def initialize(num_str = '')
    @digits = num_str.chars.map(&:to_i)
  end

  # using Enumerable#each_cons:
  def slices(size)
    raise ArgumentError, 'invalid size' unless (0..@digits.size).include?(size)
    @digits.each_cons(size).to_a
  end

  # without using Enumerable#each_cons:
  def slices(size)
    raise ArgumentError, 'invalid size' unless (0..@digits.size).include?(size)
    (0..@digits.size - size).map { |idx| @digits[idx, size] }
  end
end
