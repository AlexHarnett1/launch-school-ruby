class Robot
  attr_accessor :name
  @@names = []
  def initialize()
    @name = create_random_name
  end

  def reset
    self.name = create_random_name
  end

  private
  def create_random_name
    name = ""
    loop do
      name_arr = (0..1).map {('A'..'Z').to_a[rand(26)]}
      3.times {|x| name_arr << rand(9)}
      name = name_arr.join
      break if  (!@@names.include?(name))
    end
    @@names << name
    name
  end

end


p Robot.new.name