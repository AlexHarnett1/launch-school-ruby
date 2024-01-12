class Vehicle
  attr_accessor :color, :model, :speed
  attr_reader :year


  @@number_of_objects = 0


  def initialize(year, color, model)
    self.speed = 0
    @year = year
    self.color = color
    self.model = model
    @@number_of_objects += 1
  end


  def self.total_number_of_objects
    @@number_of_objects
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


  def age
    calculate_age
  end


  private
  def calculate_age
    Time.new.year - year
  end
end


module Fillable
  def full
    puts "Truck is full"
  end
end


class MyCar < Vehicle
  NUMBER_OF_WHEELS = 4


  def initialize(year, color, model)
    super(year, color, model)
  end
 
end


class MyTruck < Vehicle
  include Fillable
  NUMBER_OF_WHEELS = 18


  def initialize(year, color, model)
    super(year, color, model)
  end


end




blackura = MyCar.new(2002, "Black", "Acura")
blackura.spray_paint("White")
semi = MyTruck.new(2020, "Blue", "Mercedes")
semi.full
p Vehicle.ancestors
p blackura.age