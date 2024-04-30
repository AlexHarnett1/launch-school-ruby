class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise ArgumentError.new "Invalid triangle sides" unless valid?
  end

  def kind
    if sides[0] == sides[1] && sides[1] == sides[2]
      'equilateral'
    elsif sides[0] == sides[1] || sides[1] == sides[2]
      'isosceles'
    else
      'scalene'
    end
  end
=begin
Better solution
    def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end
=end

  private

  def valid?
    (sides.min > 0) && (sides[0] + sides[1] > sides[2])
  end

end