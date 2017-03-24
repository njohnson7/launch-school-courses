
# input:
  # codon: three capital letters (see key)
  # strand: String of codons all joined together
    # key:
      # AUG                  Methionine
      # UUU, UUC             Phenylalanine
      # UUA, UUG             Leucine
      # UCU, UCC, UCA, UCG   Serine
      # UAU, UAC             Tyrosine
      # UGU, UGC             Cysteine
      # UGG                  Tryptophan
      # UAA, UAG, UGA        STOP      (stop translation)
# output:
  # of_codon: String containing the protein strand that represents codon
  # of_rna: Array containing each the strand of each codon
  # raise InvalidCodonError if codon or strand is not valid
# algorithm:
  # of_codon:
    # hash w/ keys as arrays of codons, and values as a strand String
  # of_rna:
    #


# InvalidCodonError = Class.new(TypeError)

# module Translation
#   CODONS = { %w[AUG]     => 'Methionine', %w[UUU UUC]         => 'Phenylalanine',
#              %w[UUA UUG] => 'Leucine',    %w[UCU UCC UCA UCG] => 'Serine',
#              %w[UAU UAC] => 'Tyrosine',   %w[UGU UGC]         => 'Cysteine',
#              %w[UGG]     => 'Tryptophan', %w[UAA UAG UGA]     => 'STOP' }

#   def self.of_codon(codon)
#     CODONS.find { |k, _| k.include?(codon) }&.last || (raise InvalidCodonError)
#     # CODONS.find { |k, _| k.include?(codon) }.last rescue raise InvalidCodonError
#   end

#   def self.of_rna(strand)
#     strand.scan(/.{1,3}/).map { |c| of_codon(c) }.take_while { |c| c != 'STOP' }

#     codons = strand.scan(/.{1,3}/)
#     codons.reduce([]) do |arr, codon|
#       [*arr, *of_codon(codon).tap { |cod| return arr if cod == 'STOP' }]
#     end
#   end
# end



InvalidCodonError = Class.new(TypeError)

module Translation
  CODONS = { %w[AUG]     => 'Methionine', %w[UUU UUC]         => 'Phenylalanine',
             %w[UUA UUG] => 'Leucine',    %w[UCU UCC UCA UCG] => 'Serine',
             %w[UAU UAC] => 'Tyrosine',   %w[UGU UGC]         => 'Cysteine',
             %w[UGG]     => 'Tryptophan', %w[UAA UAG UGA]     => 'STOP' }

  def self.of_codon(codon)
    CODONS.find { |k, _| k.include?(codon) }&.last || (raise InvalidCodonError)
  end

  def self.of_rna(strand)
    strand.scan(/.{1,3}/).map { |c| of_codon(c) }.take_while { |c| c != 'STOP' }
  end
end
