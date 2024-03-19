class Mammal
  def speak
    "Hmmm"
  end

end

class Human < Mammal
  def speak
    "Hello!"
  end
end

class Giraffe < Mammal

end



[Human.new, Mammal.new, Giraffe.new].each do |obj|
  puts obj.speak

end