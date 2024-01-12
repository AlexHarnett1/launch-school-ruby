class Student
  attr_accessor :name

  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end

  def better_grade_than?(student2)
    self.grade > student2.grade
  end

  protected
  attr_accessor :grade
end

joe = Student.new("joe", 94)
p joe.name

bob = Student.new("bob", 90)
p bob.name

puts "Well done!" if joe.better_grade_than?(bob)