def reverse(arr)
  reversed_arr = []
  arr.reverse_each do |value|
    reversed_arr << value
  end
  reversed_arr
end