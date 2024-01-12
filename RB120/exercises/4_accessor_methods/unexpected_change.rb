class Person
  def name=(name)
    full_name = name.split
    @first_name = full_name.first
    @last_name = full_name.last
  end

  def name
    self.first_name + ' ' + self.last_name
  end

  private
  attr_accessor :first_name, :last_name
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name