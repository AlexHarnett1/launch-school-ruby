class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 0

    sum = (1..(num-1)).select {|val| num%val == 0}.sum
    if sum == num
      'perfect'
    elsif sum < num
      'deficient'
    else
      'abundant'
    end
  end
end