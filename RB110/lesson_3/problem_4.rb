def closest_numbers(arr)
  min_diff = 9999999
  closest = []
  arr.each_with_index do |value, index|
    if index != (arr.length - 1)
      ((index + 1)..(arr.length - 1)).each do |index2|
        diff = (value - arr[index2]).abs
        if diff < min_diff
          closest = [value, arr[index2]]
          min_diff = diff
        end
      end
    end
  end
  closest
end

# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".