def find_fibonacci_index_by_length(length)
  return 1 if length == 1 

  arr = [1, 1]

  loop do
    arr << (arr.last + (arr[arr.length - 2]))

     break if (arr.last / (10.pow(length - 1))) > 0
   end
   arr.length
 end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847