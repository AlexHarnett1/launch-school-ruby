class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
# Could've also used a ternary operator to determine the shorter strand
# shorter = @strand.length < strand2.length ? @strand : strand2
    distance = 0
    strand2.split('').each_with_index do |char, index|
        break if index == strand.size
        distance += 1 if char != strand[index]
      end
    distance
  end
end