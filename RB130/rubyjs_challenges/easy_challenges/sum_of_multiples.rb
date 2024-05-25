class SumOfMultiples
  attr_accessor :numbers

  def initialize(*numbers)
    @numbers = numbers.size > 0 ? numbers : [3,5]
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def to(num)
    sum = 0
    #return sum if num < 3
    (1..(num-1)).each do |val|
      sum += val if numbers.any? {|number| val % number ==0}
    end
    sum
  end

end