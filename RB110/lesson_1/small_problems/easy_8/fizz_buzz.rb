def fizzbuzz(start_num, end_num)
  arr = []
  (start_num..end_num).each do |num|
    str = ""
    str << "Fizz" if num % 3 == 0
    str << "Buzz" if num % 5 == 0
    str << num.to_s if str == "" 
    arr << str
  end
  p arr.join(", ")
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz