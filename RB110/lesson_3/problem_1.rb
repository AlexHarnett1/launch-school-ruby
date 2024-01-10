def smaller_numbers_than_current(arr)
  uniq_arr = arr.uniq
  smaller_num_array = []
  arr.each do |value|
    smaller_nums = 0
    uniq_arr.each do |value2|
      smaller_nums += 1 if value2 < value
    end
    smaller_num_array << smaller_nums
  end
  smaller_num_array
end

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".