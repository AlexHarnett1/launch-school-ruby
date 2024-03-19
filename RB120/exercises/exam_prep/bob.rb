class Something
  
end

class Person < Something
  attr_accessor :name

  def initialize(n)
    @name = n
  end

  def bob.whatever
  end

  def change_name(n)
    self.name = n
  end
end

bob = Person.new("Bob")
bob.change_name("Robert")
puts bob.name