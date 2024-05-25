class Series
  attr_accessor :series

  def initialize(series)
    @series = series

  end

  def slices(length)
    throw ArgumentError if length > series.size
    arr = []
    index = 0
    while index <= (series.size - length)
      element = series.to_s.slice(index, length)
      arr << element.split('').map!(&:to_i)
      index += 1
    end
    arr
  end

end