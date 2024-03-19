class SomeClass
  def get_access(obj)
    obj.private_method
  end

  protected
  def private_method
    "This method is private"
  end


end

a = SomeClass.new
b = SomeClass.new

puts a.get_access(b)
