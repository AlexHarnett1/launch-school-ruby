def fibonacci_last(n)
  f_numbers = [1, 1]
  iterations = 2
  while iterations < n
    f_numbers.push(f_numbers[iterations - 1] + f_numbers[iterations - 2])
    iterations += 1
  end
  f_numbers.last % 10
end



p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4