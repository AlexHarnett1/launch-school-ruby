def fibonacci(n)
  f_numbers = [1, 1]
  iterations = 2
  while iterations < n
    f_numbers.push(f_numbers[iterations - 1] + f_numbers[iterations - 2])
    iterations += 1
  end
  f_numbers.last
end

=begin
1st) 1 = 1
2nd) 0 + 1 = 1  
3rd) 1 + 1 = 2
4th) 1 + 2 = 3
5th) 2 + 3 = 5
6th) 3 + 5 = 8

=end


p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501