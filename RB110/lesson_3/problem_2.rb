def minimum_sum(arr)
  return nil if arr.length <= 4

  min_sum = 999999999999
  last_index = 4
  arr.each do |value|
    break if last_index == arr.length
    sum = 0
    first_index = last_index - 4
    (first_index..last_index).each do |index|
      sum += arr[index]
    end
    min_sum = sum if sum < min_sum
    last_index += 1
  end
  min_sum
end


# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".