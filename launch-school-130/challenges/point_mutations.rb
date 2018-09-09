# Write a program that can calculate the Hamming difference between two DNA
# strands.

# A mutation is simply a mistake that occurs during the creation or copying of a
# nucleic acid, in particular DNA. Because nucleic acids are vital to cellular
# functions, mutations tend to cause a ripple effect throughout the cell.
# Although mutations are technically mistakes, a very rare mutation may equip
# the cell with a beneficial attribute. In fact, the macro effects of evolution
# are attributable by the accumulated result of beneficial microscopic mutations
# over many generations.

# The simplest and most common type of nucleic acid mutation is a point
# mutation, which replaces one base with another at a single nucleotide.

# By counting the number of differences between two homologous DNA strands taken
# from different genomes with a common ancestor, we get a measure of the minimum
# number of point mutations that could have occurred on the evolutionary path
# between the two strands.

# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^

# The Hamming distance between these two DNA strands is 7.

# The Hamming distance is only defined for sequences of equal length. If you
# have two sequences of unequal length, you should compute the Hamming distance
# over the shorter length.

# input: 2 DNA strands: Strings consisting of [ATGC] of same/different lengths
# output: number of chars that strands differ by
# rules:
  # if strands are different lengths, then start at beginning on both strands
  #  and ignore the extra chars
# algorithm:
  # determine shorter strand
  # loop thru each char of shorter strand w/ index
    # check if char at index == char at index of other strand
      # if so, increment counter by 1
  # return counter


class DNA
  def initialize(strand)
    @strand = strand
  end

  # using Array#zip:
  def hamming_distance(strand)
    @strand[0, strand.size].chars.zip(strand.chars).count { |a, b| a != b }
  end

  # using index instead of Array#zip:

  # def hamming_distance(strand)
  #   stop_idx = [@strand.size, strand.size].min
  #   (0...stop_idx).count { |idx| @strand[idx] != strand[idx] }
  # end
end
