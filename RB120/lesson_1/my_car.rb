class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year
  def initialize(year, color, model)
    self.speed = 0
    @year = year
    self.color = color
    self.model = model
  end

  def speed_up(amt)
    self.speed += amt
  end

  def slow_down(amt)
    self.speed -= amt
  end

  def turn_off
    self.speed = 0
  end

  def spray_paint(color)
    self.color = color
  end

  def self.gas_mileage(miles, gallons_used)
    miles/gallons_used.to_f
  end

  def to_s
    puts "You have a #{color} #{year} #{model}"
  end
end


  blackura = MyCar.new(2002, "Black", "Acura")
  blackura.spray_paint("White")
  p blackura.color
  p blackura.year
  puts blackura