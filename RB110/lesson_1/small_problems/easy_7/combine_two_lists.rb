def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do  |_, index|
    new_arr << arr1[index] << arr2[index]
  end
  new_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']