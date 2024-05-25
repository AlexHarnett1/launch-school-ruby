class Octal
  attr_accessor :str
  def initialize(str)
    @str = str
  end

  def to_decimal
    arr = str.split('')
    return 0 unless arr.all? {|val| val.match?(/[0-7]/)}
    num_arr = arr.map(&:to_i)
    sum = 0
    num_arr.each_with_index do |val, index|
      sum += 8.pow(num_arr.length-index-1) * val
    end
    sum
    
  end

end