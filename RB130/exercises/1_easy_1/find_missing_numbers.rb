def missing(arr)
  new_arr = []
  (arr.first..arr.last).each do |elem|
    new_arr << elem unless arr.include?(elem)
  end
  new_arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

=begin

def missing(nums)
  (nums.min..nums.max).to_a - nums
end
  
end