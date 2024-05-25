class RomanNumeral
  ROMANS = {"I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000}
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_roman
    
    while value > 0

    end
  end
=begin
  Rules:
    - Find the letter that is closest to the given value
      - exception is when the value is greater than 1000
    - 

=end
end