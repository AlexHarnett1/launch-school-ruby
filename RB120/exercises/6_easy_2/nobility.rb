module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end

  def to_s
    "#{name}"
  end
end

class Noble
  include Walkable

  attr_reader :title, :name

  def initialize(name, title)
    @name = name
    @title = title
  end

  def gait
    "struts"
  end

  def to_s
    "#{title} #{name}"
  end
end


byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"