WIDTH = 1

class Bed
  WIDTH = 3
  def width
    # Can't just do WIDTH here, or else it will always return 3 without taking into account
    # sub classes.
    WIDTH
  end
end


class King < Bed
  WIDTH = 6
end

class Twin < Bed
end

p King.new.width
p Bed.new.width
p Twin.new.width