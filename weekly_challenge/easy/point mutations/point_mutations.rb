class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    index = 0
    count = 0
    while index < [strand.size, distance.size].min 
      count += 1 unless strand[index] == distance[index]
      index += 1
    end
    count
  end
end